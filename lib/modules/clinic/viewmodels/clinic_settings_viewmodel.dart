import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/clinic/models/clinic_doctors_model.dart';
import 'package:drandme/core/config/service.dart';

/// Represents a role returned from GET /admin/staff/roles
class StaffRole {
  final String id;
  final String name;
  final String? description;
  final bool isSystemRole;

  const StaffRole({
    required this.id,
    required this.name,
    this.description,
    this.isSystemRole = true,
  });

  factory StaffRole.fromJson(Map<String, dynamic> json) {
    return StaffRole(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString(),
      isSystemRole: json['is_system_role'] as bool? ?? true,
    );
  }

  /// Converts snake_case role name to Title Case display label.
  /// e.g. 'lab_technician' → 'Lab Technician'
  String get displayLabel => name
      .split('_')
      .map((w) => w.isNotEmpty ? w[0].toUpperCase() + w.substring(1) : w)
      .join(' ');
}

class StaffMember {
  final String? id;
  final String? userId; // User ID from auth system
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String username;
  final String role;
  final String? department;
  final String? joiningDate;
  final List<String> permissions;
  final bool isActive;
  final DateTime? createdAt;

  StaffMember({
    this.id,
    this.userId,
    this.firstName = "",
    required this.lastName,
    required this.email,
    required this.phone,
    required this.username,
    required this.role,
    this.department,
    this.joiningDate,
    this.permissions = const [],
    this.isActive = true,
    this.createdAt,
  });

  // ── Display helpers ────────────────────────────────────────
  /// Avatar initial: safe even when firstName is empty.
  String get initial => firstName.isNotEmpty ? firstName[0].toUpperCase() : '?';

  /// Full name, trimmed; falls back to username when both parts are empty.
  String get fullName {
    final name = '${firstName.trim()} ${lastName.trim()}'.trim();
    return name.isNotEmpty
        ? name
        : (username.isNotEmpty ? username : 'Unknown');
  }

  /// Display email — shows placeholder when empty.
  String get displayEmail => email.isNotEmpty ? email : 'No email';

  /// Display phone — shows placeholder when empty.
  String get displayPhone => phone.isNotEmpty ? phone : 'No phone';

  /// Title-case role label: 'lab_technician' → 'Lab Technician'.
  String get displayRole => role
      .split('_')
      .map((w) => w.isNotEmpty ? w[0].toUpperCase() + w.substring(1) : w)
      .join(' ');

  factory StaffMember.fromJson(Map<String, dynamic> json) {
    // Helper: treat null and empty string both as empty string
    String safeStr(dynamic v) => (v?.toString() ?? '').trim();

    return StaffMember(
      id: json['id']?.toString() ?? json['user_id']?.toString(),
      userId: json['user_id']?.toString() ?? json['id']?.toString(),
      firstName: safeStr(json['first_name']),
      lastName: safeStr(json['last_name']),
      email: safeStr(json['email']),
      phone: safeStr(json['phone'] ?? json['phone_number']),
      username: safeStr(json['username']),
      role: safeStr(json['staff_type'] ?? json['role']),
      department: json['department']?.toString().trim().isNotEmpty == true
          ? json['department'].toString().trim()
          : null,
      joiningDate: json['joining_date']?.toString().trim().isNotEmpty == true
          ? json['joining_date'].toString().trim()
          : null,
      permissions: _parsePermissions(json['permissions']),
      isActive: json['is_active'] as bool? ?? true,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'].toString())
          : null,
    );
  }

  static List<String> _parsePermissions(dynamic permissions) {
    if (permissions == null) return [];
    if (permissions is String) {
      if (permissions.isEmpty) return [];
      try {
        final decoded = jsonDecode(permissions);
        if (decoded is List) return List<String>.from(decoded);
      } catch (e) {
        return [];
      }
    }
    if (permissions is List) {
      return permissions.map((e) => e.toString()).toList();
    }
    return [];
  }
}

class UpdateStaffRequest {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  String? staffType;
  String? department;
  String? joiningDate;
  List<String>? permissions;
  bool? isActive;

  UpdateStaffRequest({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
    this.staffType,
    this.department,
    this.joiningDate,
    this.permissions,
    this.isActive,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (firstName != null) data['first_name'] = firstName;
    if (lastName != null) data['last_name'] = lastName;
    if (email != null) data['email'] = email;
    if (phone != null) data['phone'] = phone;
    if (password != null && password!.isNotEmpty) data['password'] = password;
    if (staffType != null) data['staff_type'] = staffType;
    if (department != null) data['department'] = department;
    if (joiningDate != null) data['joining_date'] = joiningDate;
    if (permissions != null) data['permissions'] = permissions;
    if (isActive != null) data['is_active'] = isActive;
    return data;
  }
}

class ClinicSettingsViewModel extends ChangeNotifier {
  final AuthViewModel _authViewModel;
  final ServiceRepo _serviceRepo;

  ClinicSettingsViewModel(this._authViewModel) : _serviceRepo = ServiceRepo();

  // State variables
  bool _isLoading = false;
  String _error = '';

  // Clinic doctors data
  List<ClinicDoctorModel> _clinicDoctors = [];
  List<ClinicDoctorModel> _filteredDoctors = [];

  // Staff data
  List<StaffMember> _staffMembers = [];
  List<StaffMember> _filteredStaff = [];

  // Available roles from API
  List<StaffRole> _staffRoles = [];
  List<String> _departments = [];
  bool _rolesLoading = false;
  bool _departmentsLoading = false;

  String _searchQuery = '';

  // Getters
  bool get isLoading => _isLoading;
  bool get rolesLoading => _rolesLoading;
  bool get departmentsLoading => _departmentsLoading;
  String get error => _error;
  List<ClinicDoctorModel> get clinicDoctors => _filteredDoctors;
  List<StaffMember> get staffMembers => _filteredStaff;
  List<StaffRole> get staffRoles => List.unmodifiable(_staffRoles);
  List<String> get departments => List.unmodifiable(_departments);
  String get searchQuery => _searchQuery;

  // Stats — compare against the role name (snake_case from API)
  int get totalStaff => _staffMembers.length;
  int get totalDoctors => _clinicDoctors.length;
  int get totalNurses =>
      _staffMembers.where((s) => s.role.toLowerCase() == 'nurse').length;
  int get totalReceptionists =>
      _staffMembers.where((s) => s.role.toLowerCase() == 'receptionist').length;

  // Load clinic doctors
  Future<void> loadClinicDoctors() async {
    try {
      _isLoading = true;
      _error = '';
      notifyListeners();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        _isLoading = false;
        notifyListeners();
        return;
      }

      final clinicId = _authViewModel.user?.clinicId;
      if (clinicId == null || clinicId.isEmpty) {
        _error = 'Clinic ID not found';
        _isLoading = false;
        notifyListeners();
        return;
      }

      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     LOADING CLINIC DOCTORS (CLINIC SETTINGS)                  ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('🏥 Clinic ID: $clinicId');
      print('🔑 Token: ${token.substring(0, 20)}...');
      print('');

      final response = await _serviceRepo.requist(
        'doctors/clinic/$clinicId',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      if (response != null && response['doctors'] != null) {
        final doctorsList = response['doctors'] as List<dynamic>;

        print('📋 RAW DOCTOR DATA FROM API:');
        print('═══════════════════════════════════════════════════════');
        for (var i = 0; i < doctorsList.length && i < 2; i++) {
          print('Doctor ${i + 1}:');
          print(doctorsList[i]);
          print('---');
        }
        print('');

        _clinicDoctors = doctorsList
            .map((json) => ClinicDoctorModel.fromJson(json))
            .toList();

        _filteredDoctors = List.from(_clinicDoctors);

        print('✅ Loaded ${_clinicDoctors.length} clinic doctors');

        // Debug: Print first doctor's IDs
        if (_clinicDoctors.isNotEmpty) {
          final firstDoctor = _clinicDoctors.first;
          print('🔍 FIRST DOCTOR ID FIELDS AFTER PARSING:');
          print('   id: ${firstDoctor.id}');
          print('   linkId: ${firstDoctor.linkId}');
          print('   doctorId: ${firstDoctor.doctorId}');
          print('   userId: ${firstDoctor.userId}');
          print('   fullName: ${firstDoctor.fullName}');
          print('   firstName: ${firstDoctor.firstName}');
          print('   lastName: ${firstDoctor.lastName}');
        }
        print('');
      } else {
        print('❌ No doctors found or invalid response');
        _clinicDoctors = [];
        _filteredDoctors = [];
      }
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN loadClinicDoctors                                 ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('❌ Error: $e');
      print('📍 Stack trace:');
      print(stackTrace);
      print('');
      _error = 'Error loading clinic doctors: $e';
      _clinicDoctors = [];
      _filteredDoctors = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Load staff members
  Future<void> loadStaffMembers({String? role}) async {
    try {
      _isLoading = true;
      _error = '';
      notifyListeners();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        return;
      }

      final clinicId = _authViewModel.user?.clinicId;
      if (clinicId == null || clinicId.isEmpty) {
        _error = 'Clinic ID not found';
        return;
      }

      String endpoint = 'admin/staff/clinic/$clinicId';
      if (role != null && role.isNotEmpty) {
        endpoint += '?role=$role';
      }

      print('');
      print('╔══════════════════════════════════════════════════════╗');
      print('║         LOAD STAFF LIST — REQUEST                    ║');
      print('╚══════════════════════════════════════════════════════╝');
      print('🌐 GET /api/$endpoint');
      print('');

      final response = await _serviceRepo.requist(
        endpoint,
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      print('╔══════════════════════════════════════════════════════╗');
      print('║         LOAD STAFF LIST — RESPONSE                   ║');
      print('╚══════════════════════════════════════════════════════╝');
      print('📨 Response type : ${response.runtimeType}');
      print('📨 Response value: $response');
      print('');

      List<dynamic> staffList = [];

      if (response is List) {
        // New API: returns a flat JSON array   → [ {...}, {...} ]
        print('✅ Response is a flat List (new API format)');
        staffList = response;
      } else if (response is Map && response['staff'] != null) {
        // Old / wrapped format                → { "staff": [ {...} ] }
        print('✅ Response is a Map with "staff" key');
        staffList = response['staff'] as List<dynamic>;
      } else if (response is Map && response['data'] != null) {
        // Possible alternative wrapper         → { "data": [ {...} ] }
        print('✅ Response is a Map with "data" key');
        staffList = response['data'] as List<dynamic>;
      } else {
        print('⚠️  Unexpected response shape — no staff loaded');
        print('   Full response: $response');
      }

      print('👥 Staff count: ${staffList.length}');
      for (var s in staffList) {
        print('   • ${s["first_name"]} ${s["last_name"]} (${s["staff_type"]})');
      }
      print('');

      _staffMembers = staffList
          .map((json) => StaffMember.fromJson(json as Map<String, dynamic>))
          .toList();
      _filteredStaff = List.from(_staffMembers);
    } catch (e, stack) {
      print('❌ [loadStaffMembers] Exception: $e');
      print('   Stack: $stack');
      _error = 'Error loading staff members: $e';
      _staffMembers = [];
      _filteredStaff = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ─────────────────────────────────────────────
  // Step 1: Fetch available staff roles
  // GET /admin/staff/roles
  // ─────────────────────────────────────────────

  /// The 5 known system roles, used as fallback when the API is unreachable.
  static const _fallbackRoles = [
    {
      'id': 'billing_staff',
      'name': 'billing_staff',
      'description': 'Handles billing and payments',
      'is_system_role': true,
    },
    {
      'id': 'lab_technician',
      'name': 'lab_technician',
      'description': 'Performs lab tests',
      'is_system_role': true,
    },
    {
      'id': 'nurse',
      'name': 'nurse',
      'description': 'Assists doctors and patients',
      'is_system_role': true,
    },
    {
      'id': 'pharmacist',
      'name': 'pharmacist',
      'description': 'Manages pharmacy dispensing',
      'is_system_role': true,
    },
    {
      'id': 'receptionist',
      'name': 'receptionist',
      'description': 'Front desk and appointments',
      'is_system_role': true,
    },
  ];

  Future<void> fetchStaffRoles() async {
    // Only skip if roles were successfully fetched (non-empty)
    if (_staffRoles.isNotEmpty) return;
    try {
      _rolesLoading = true;
      notifyListeners();

      final token = _authViewModel.accessToken;
      if (token == null) {
        print('⚠️  [fetchStaffRoles] No token — using fallback roles');
        _staffRoles = _fallbackRoles.map((j) => StaffRole.fromJson(j)).toList();
        return;
      }

      print('');
      print('╔══════════════════════════════════════════════════════╗');
      print('║         FETCH STAFF ROLES — REQUEST                  ║');
      print('╚══════════════════════════════════════════════════════╝');
      print('🌐 GET /api/admin/staff/roles');
      print('🔑 Token: ${token.substring(0, 20)}...');
      print('');

      final response = await _serviceRepo.requist(
        'admin/staff/roles',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      print('╔══════════════════════════════════════════════════════╗');
      print('║         FETCH STAFF ROLES — RESPONSE                 ║');
      print('╚══════════════════════════════════════════════════════╝');

      if (response != null && response['roles'] != null) {
        final list = response['roles'] as List<dynamic>;
        print('✅ Roles received: ${list.length}');
        for (var r in list) {
          print('   • ${r["name"]} — ${r["description"]}');
        }
        print('');
        if (list.isNotEmpty) {
          _staffRoles = list.map((j) => StaffRole.fromJson(j)).toList();
        } else {
          print('⚠️  Empty list from API — using fallback roles');
          _staffRoles = _fallbackRoles
              .map((j) => StaffRole.fromJson(j))
              .toList();
        }
      } else {
        print('❌ No response or missing roles key — using fallback roles');
        print('   Raw response: $response');
        print('');
        _staffRoles = _fallbackRoles.map((j) => StaffRole.fromJson(j)).toList();
      }
    } catch (e) {
      print('❌ [fetchStaffRoles] Exception: $e');
      _staffRoles = _fallbackRoles.map((j) => StaffRole.fromJson(j)).toList();
    } finally {
      _rolesLoading = false;
      notifyListeners();
    }
  }

  // ─────────────────────────────────────────────
  // Step 2: Create staff member
  // POST /admin/staff
  // ─────────────────────────────────────────────
  Future<bool> createStaffMember({
    String? firstName,
    String? lastName,
    String? email,
    required String username,
    String? phone,
    required String password,
    required String staffType,
    String? department,
    String? joiningDate,
    List<String> permissions = const [],
  }) async {
    try {
      _isLoading = true;
      _error = '';
      notifyListeners();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        return false;
      }

      final clinicId = _authViewModel.user?.clinicId;
      if (clinicId == null || clinicId.isEmpty) {
        _error = 'Clinic ID not found';
        return false;
      }

      // Build body only with fields that have values (per API spec)
      final Map<String, dynamic> body = {
        'username': username,
        'password': password,
        'staff_type': staffType,
        'permissions': permissions,
        'clinic_id': clinicId,
      };
      if (firstName != null && firstName.isNotEmpty)
        body['first_name'] = firstName;
      if (lastName != null && lastName.isNotEmpty) body['last_name'] = lastName;
      if (email != null && email.isNotEmpty) body['email'] = email;
      if (phone != null && phone.isNotEmpty) body['phone'] = phone;
      if (department != null && department.isNotEmpty)
        body['department'] = department;
      if (joiningDate != null && joiningDate.isNotEmpty)
        body['joining_date'] = joiningDate;

      print('');
      print('╔══════════════════════════════════════════════════════╗');
      print('║         CREATE STAFF — REQUEST                       ║');
      print('╚══════════════════════════════════════════════════════╝');
      print('🌐 POST /api/admin/staff');
      print('🔑 Token: ${token.substring(0, 20)}...');
      print('📦 Request Body:');
      body.forEach((key, val) {
        // Mask password in logs
        final display = key == 'password' ? '***' : val;
        print('   $key: $display');
      });
      print('');

      final response = await _serviceRepo.requist(
        'admin/staff',
        method: 'POST',
        token: token,
        body: body,
        useOrgApi: true,
      );

      print('╔══════════════════════════════════════════════════════╗');
      print('║         CREATE STAFF — RESPONSE                      ║');
      print('╚══════════════════════════════════════════════════════╝');

      if (response != null) {
        print('✅ Staff created successfully!');
        print('   Staff ID : ${response["id"] ?? "(not returned)"}');
        print('   User  ID : ${response["user_id"] ?? "(not returned)"}');
        print('   Message  : ${response["message"] ?? "(none)"}');
        print('');
        await loadStaffMembers();
        return true;
      } else {
        print('❌ Response was null — possible 400/401/500 from server');
        print('');
        _error = 'Failed to create staff member';
        return false;
      }
    } catch (e, stack) {
      print('❌ [createStaffMember] Exception: $e');
      print('   Stack: $stack');
      _error = 'Error creating staff member: $e';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get staff details
  Future<StaffMember?> getStaffDetails(String staffId) async {
    try {
      final token = _authViewModel.accessToken;
      if (token == null) return null;

      final clinicId = _authViewModel.user?.clinicId;
      if (clinicId == null || clinicId.isEmpty) return null;

      print('');
      print('╔══════════════════════════════════════════════════════╗');
      print('║         GET STAFF DETAILS — REQUEST                 ║');
      print('╚══════════════════════════════════════════════════════╝');
      print('🌐 GET /api/admin/staff/clinic/$clinicId/$staffId');
      print('');

      final response = await _serviceRepo.requist(
        'admin/staff/clinic/$clinicId/$staffId',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      print('╔══════════════════════════════════════════════════════╗');
      print('║         GET STAFF DETAILS — RESPONSE                ║');
      print('╚══════════════════════════════════════════════════════╝');
      print('📨 Response: $response');
      print('');

      if (response != null) {
        // Handle wrapper vs flat object
        dynamic staffJson;
        if (response is Map) {
          if (response['staff'] != null) {
            staffJson = response['staff'];
          } else if (response['data'] != null) {
            staffJson = response['data'];
          } else {
            // Assume it's a flat object if it has common staff fields
            if (response.containsKey('first_name') ||
                response.containsKey('username')) {
              staffJson = response;
            }
          }
        }

        if (staffJson != null) {
          return StaffMember.fromJson(staffJson as Map<String, dynamic>);
        }
      }

      // Fallback: Check local list if API fails
      print(
        '⚠️  API detail fetch failed or returned null. Checking local list...',
      );
      final localStaff = _staffMembers.cast<StaffMember?>().firstWhere(
        (s) => s?.id == staffId,
        orElse: () => null,
      );

      if (localStaff != null) {
        print('✅ Found staff member in local list as fallback');
        return localStaff;
      }

      print('❌ Staff not found in local list either');
      return null;
    } catch (e) {
      print('❌ Error getting staff details: $e');
      // Final fallback attempt even on exception
      try {
        final localStaff = _staffMembers.cast<StaffMember?>().firstWhere(
          (s) => s?.id == staffId,
          orElse: () => null,
        );
        return localStaff;
      } catch (_) {}
      return null;
    }
  }

  // Update staff member
  Future<bool> updateStaffMember(
    String userId,
    UpdateStaffRequest request,
  ) async {
    try {
      _isLoading = true;
      _error = '';
      notifyListeners();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        return false;
      }

      final clinicId = _authViewModel.user?.clinicId;
      if (clinicId == null || clinicId.isEmpty) {
        _error = 'Clinic ID not found';
        return false;
      }

      print('');
      print('╔══════════════════════════════════════════════════════╗');
      print('║         UPDATE STAFF — REQUEST                       ║');
      print('╚══════════════════════════════════════════════════════╝');
      print('🌐 PUT /api/admin/staff/clinic/$clinicId/$userId');
      print('📦 Body: ${request.toJson()}');
      print('');

      final response = await _serviceRepo.requist(
        'admin/staff/clinic/$clinicId/$userId',
        method: 'PUT',
        token: token,
        body: request.toJson(),
        useOrgApi: true,
      );

      if (response != null) {
        print('✅ Staff updated successfully');
        await loadStaffMembers();
        return true;
      } else {
        _error = 'Failed to update staff member';
        return false;
      }
    } catch (e) {
      print('❌ [updateStaffMember] Exception: $e');
      _error = 'Error updating staff member: $e';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Fetch departments
  Future<void> fetchClinicDepartments() async {
    if (_departments.isNotEmpty) return;
    try {
      _departmentsLoading = true;
      notifyListeners();

      final token = _authViewModel.accessToken;
      final clinicId = _authViewModel.user?.clinicId;

      if (token == null || clinicId == null) {
        _departments = [
          'OPD',
          'IPD',
          'Pharmacy',
          'Laboratory',
          'Radiology',
          'Emergency',
        ];
        return;
      }

      // Default departments
      _departments = [
        'OPD',
        'IPD',
        'Pharmacy',
        'Laboratory',
        'Radiology',
        'Emergency',
      ];

      // Optional: fetch from API if available
      final response = await _serviceRepo.requist(
        'clinic/departments/$clinicId',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      if (response != null && response['departments'] != null) {
        _departments = List<String>.from(response['departments']);
      }
    } catch (e) {
      // Keep defaults
    } finally {
      _departmentsLoading = false;
      notifyListeners();
    }
  }

  // Search/filter doctors and staff
  void searchDoctors(String query) {
    _searchQuery = query;
    final lowerQuery = query.toLowerCase();

    // Filter doctors
    if (query.isEmpty) {
      _filteredDoctors = List.from(_clinicDoctors);
    } else {
      _filteredDoctors = _clinicDoctors.where((doctor) {
        final name =
            (doctor.fullName ?? '${doctor.firstName} ${doctor.lastName}')
                .toLowerCase();
        return name.contains(lowerQuery) ||
            (doctor.email ?? '').toLowerCase().contains(lowerQuery);
      }).toList();
    }

    // Filter staff
    if (query.isEmpty) {
      _filteredStaff = List.from(_staffMembers);
    } else {
      _filteredStaff = _staffMembers.where((staff) {
        return staff.fullName.toLowerCase().contains(lowerQuery) ||
            staff.email.toLowerCase().contains(lowerQuery) ||
            staff.role.toLowerCase().contains(lowerQuery);
      }).toList();
    }

    notifyListeners();
  }

  // Clear search
  void clearSearch() {
    _searchQuery = '';
    _filteredDoctors = List.from(_clinicDoctors);
    notifyListeners();
  }

  // Reload doctors
  Future<void> reload() async {
    await loadClinicDoctors();
  }

  void clearError() {
    _error = '';
    notifyListeners();
  }
}
