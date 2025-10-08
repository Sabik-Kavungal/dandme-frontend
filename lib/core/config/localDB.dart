import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'dart:io';

class LocalDatabaseService {
  final Logger _logger = Logger();
  final Map<String, Box> _openBoxes = {};

  Future<Box<T>> openBox<T>(String boxName) async {
    try {
      // Check if box is already open
      if (_openBoxes.containsKey(boxName) && _openBoxes[boxName]!.isOpen) {
        return _openBoxes[boxName] as Box<T>;
      }

      // Try to open the box
      Box<T> box;
      try {
        box = await Hive.openBox<T>(boxName);
      } catch (e) {
        // If lock file exists and is causing issues, try to delete it
        if (e.toString().contains('lock failed') ||
            e.toString().contains('PathAccessException')) {
          _logger.w(
            'Lock file conflict detected for $boxName, attempting to resolve...',
          );

          // Try to delete the lock file
          try {
            final lockFile = File('${Directory.current.path}/$boxName.lock');
            if (await lockFile.exists()) {
              await lockFile.delete();
              _logger.i('Deleted lock file for $boxName');
            }
          } catch (deleteError) {
            _logger.w('Could not delete lock file: $deleteError');
          }

          // Try opening again after lock file cleanup
          box = await Hive.openBox<T>(boxName);
        } else {
          rethrow;
        }
      }

      _openBoxes[boxName] = box;
      return box;
    } catch (e) {
      _logger.e('Error opening box $boxName: $e');
      rethrow;
    }
  }

  Future<void> toDb<T>(Box<T> box, String key, T value) async {
    try {
      await box.put(key, value);
    } catch (e) {
      _logger.e('Error saving data in box ${box.name}: $e');
      rethrow;
    }
  }

  T? fromDb<T>(Box<T> box, String key) {
    try {
      return box.get(key);
    } catch (e) {
      _logger.e('Error getting data from box ${box.name}: $e');
      return null;
    }
  }

  Future<void> deleteDb<T>(Box<T> box, String key) async {
    try {
      await box.delete(key);
    } catch (e) {
      _logger.e('Error deleting data from box ${box.name}: $e');
      rethrow;
    }
  }

  /// Clear a whole box. Accepts either a Box instance OR a boxName (String).
  Future<void> clearBox(dynamic boxOrName) async {
    try {
      if (boxOrName is Box) {
        await boxOrName.clear();
        _logger.i('Box ${boxOrName.name} cleared successfully');
        return;
      }

      if (boxOrName is String) {
        final Box<dynamic> box = await openBox<dynamic>(boxOrName);
        await box.clear();
        _logger.i('Box $boxOrName cleared successfully');
        return;
      }

      throw ArgumentError('clearBox expects a Box or a String box name');
    } catch (e) {
      _logger.e('Error clearing box: $e');
      rethrow;
    }
  }

  Future<void> closeBox<T>(Box<T> box) async {
    try {
      if (box.isOpen) {
        await box.close();
        _openBoxes.remove(box.name);
        _logger.i('Box ${box.name} closed successfully');
      }
    } catch (e) {
      _logger.e('Error closing box ${box.name}: $e');
      // Don't rethrow to prevent app crashes
    }
  }

  Future<void> closeBoxByName(String boxName) async {
    try {
      if (_openBoxes.containsKey(boxName)) {
        final box = _openBoxes[boxName]!;
        if (box.isOpen) {
          await box.close();
          _openBoxes.remove(boxName);
          _logger.i('Box $boxName closed successfully');
        }
      }
    } catch (e) {
      _logger.e('Error closing box $boxName: $e');
    }
  }

  Future<void> closeAllBoxes() async {
    try {
      for (final boxName in _openBoxes.keys.toList()) {
        await closeBoxByName(boxName);
      }
      _logger.i('All boxes closed successfully');
    } catch (e) {
      _logger.e('Error closing all boxes: $e');
    }
  }

  bool isBoxOpen<T>(Box<T> box) => box.isOpen;

  bool isBoxOpenByName(String boxName) {
    return _openBoxes.containsKey(boxName) && _openBoxes[boxName]!.isOpen;
  }
}
