import 'dart:typed_data';
import 'package:http/http.dart' as http;

/// Service to handle image loading with CORS workaround for Flutter Web
class ImageLoaderService {
  static final ImageLoaderService _instance = ImageLoaderService._internal();
  factory ImageLoaderService() => _instance;
  ImageLoaderService._internal();

  // Cache for loaded images to avoid repeated requests
  final Map<String, Uint8List?> _imageCache = {};

  /// Load image from URL with CORS workaround
  /// Returns null if image cannot be loaded
  Future<Uint8List?> loadImage(String imageUrl) async {
    // Check cache first
    if (_imageCache.containsKey(imageUrl)) {
      return _imageCache[imageUrl];
    }

    try {
      print('Attempting to load image from: $imageUrl');

      // Try direct load first (works on mobile and if CORS is configured)
      final response = await http
          .get(Uri.parse(imageUrl))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        _imageCache[imageUrl] = bytes;
        print('Successfully loaded image from: $imageUrl');
        return bytes;
      } else {
        print('Failed to load image. Status code: ${response.statusCode}');
        _imageCache[imageUrl] = null;
        return null;
      }
    } catch (e) {
      print('Error loading image from $imageUrl: $e');
      _imageCache[imageUrl] = null;
      return null;
    }
  }

  /// Clear the image cache
  void clearCache() {
    _imageCache.clear();
  }

  /// Remove specific image from cache
  void removeFromCache(String imageUrl) {
    _imageCache.remove(imageUrl);
  }
}
