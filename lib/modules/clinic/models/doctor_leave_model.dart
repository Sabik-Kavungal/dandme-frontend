typedef DoctorLeave = DoctorLeaveModel;

class DoctorLeaveListResponse {
  final List<DoctorLeaveModel> leaves;
  final Map<String, dynamic> pagination;

  DoctorLeaveListResponse({required this.leaves, required this.pagination});

  factory DoctorLeaveListResponse.fromJson(Map<String, dynamic> json) {
    return DoctorLeaveListResponse(
      leaves: (json['leaves'] as List)
          .map((e) => DoctorLeaveModel.fromJson(e))
          .toList(),
      pagination: json['pagination'] ?? {},
    );
  }
}

class ApplyLeaveRequest {
  final String doctorId;
  final String clinicId;
  final String leaveType;
  final String fromDate;
  final String toDate;
  final String? daysType; // optional or specific
  final String? reason;

  ApplyLeaveRequest({
    required this.doctorId,
    required this.clinicId,
    required this.leaveType,
    required this.fromDate,
    required this.toDate,
    this.daysType,
    this.reason,
  });
  Map<String, dynamic> toJson() {
    return {
      'doctor_id': doctorId,
      'clinic_id': clinicId,
      'leave_type': leaveType,
      'from_date': fromDate,
      'to_date': toDate,
      'leave_duration': daysType ?? 'full_day',
      if (reason != null) 'reason': reason,
    };
  }
}

class ApplyLeaveResponse {
  final String message;
  final String leaveId;
  final String status;
  final int totalDays;

  ApplyLeaveResponse({
    required this.message,
    required this.leaveId,
    required this.status,
    required this.totalDays,
  });

  factory ApplyLeaveResponse.fromJson(Map<String, dynamic> json) {
    return ApplyLeaveResponse(
      message: json['message'] ?? '',
      leaveId: json['leave_id'],
      status: json['status'],
      totalDays: json['total_days'] ?? 0,
    );
  }
}

class UpdateLeaveRequest {
  final String? doctorId;
  final String? clinicId;
  final String? leaveType;
  final String? fromDate;
  final String? toDate;
  final String? daysType;
  final String? reason;

  UpdateLeaveRequest({
    this.doctorId,
    this.clinicId,
    this.leaveType,
    this.fromDate,
    this.toDate,
    this.daysType,
    this.reason,
  });
  Map<String, dynamic> toJson() {
    return {
      if (doctorId != null) 'doctor_id': doctorId,
      if (clinicId != null) 'clinic_id': clinicId,
      if (leaveType != null) 'leave_type': leaveType,
      if (fromDate != null) 'from_date': fromDate,
      if (toDate != null) 'to_date': toDate,
      if (daysType != null) 'leave_duration': daysType,
      if (reason != null) 'reason': reason,
    };
  }
}

class ReviewLeaveRequest {
  final String status;
  final String? reviewNotes;

  ReviewLeaveRequest({required this.status, this.reviewNotes});
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      if (reviewNotes != null) 'review_notes': reviewNotes,
    };
  }
}

class DoctorLeaveStats {
  final String doctorId;
  final int totalLeaves;
  final int pendingLeaves;
  final int approvedLeaves;
  final int rejectedLeaves;
  final int cancelledLeaves;
  final int totalDaysThisYear;

  DoctorLeaveStats({
    required this.doctorId,
    required this.totalLeaves,
    required this.pendingLeaves,
    required this.approvedLeaves,
    required this.rejectedLeaves,
    required this.cancelledLeaves,
    required this.totalDaysThisYear,
  });

  factory DoctorLeaveStats.fromJson(Map<String, dynamic> json) {
    return DoctorLeaveStats(
      doctorId: json['doctor_id'],
      totalLeaves: json['total_leaves'] ?? 0,
      pendingLeaves: json['pending_leaves'] ?? 0,
      approvedLeaves: json['approved_leaves'] ?? 0,
      rejectedLeaves: json['rejected_leaves'] ?? 0,
      cancelledLeaves: json['cancelled_leaves'] ?? 0,
      totalDaysThisYear: json['total_days_this_year'] ?? 0,
    );
  }
}

class DoctorLeaveModel {
  final String id;
  final String doctorId;
  final String? doctorName;
  final String clinicId;
  final String? clinicName;
  final String leaveType;
  final String fromDate;
  final String toDate;
  final String? daysType;
  final int totalDays;
  final String reason;
  final String status;
  final String appliedAt;
  final String? reviewedAt;
  final String? reviewedBy;
  final String? reviewedByName;
  final String? reviewNotes;
  final String createdAt;

  DoctorLeaveModel({
    required this.id,
    required this.doctorId,
    this.doctorName,
    required this.clinicId,
    this.clinicName,
    required this.leaveType,
    required this.fromDate,
    required this.toDate,
    this.daysType,
    required this.totalDays,
    required this.reason,
    required this.status,
    required this.appliedAt,
    this.reviewedAt,
    this.reviewedBy,
    this.reviewedByName,
    this.reviewNotes,
    required this.createdAt,
  });

  factory DoctorLeaveModel.fromJson(Map<String, dynamic> json) {
    return DoctorLeaveModel(
      id: json['id'],
      doctorId: json['doctor_id'],
      doctorName: json['doctor_name'],
      clinicId: json['clinic_id'],
      clinicName: json['clinic_name'],
      leaveType: json['leave_type'],
      fromDate: json['from_date'],
      toDate: json['to_date'],
      daysType: json['leave_duration'] ?? json['days_type'],
      totalDays: json['total_days'] ?? 0,
      reason: json['reason'] ?? '',
      status: json['status'],
      appliedAt: json['applied_at'],
      reviewedAt: json['reviewed_at'],
      reviewedBy: json['reviewed_by'],
      reviewedByName: json['reviewed_by_name'],
      reviewNotes: json['review_notes'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctor_id': doctorId,
      'doctor_name': doctorName,
      'clinic_id': clinicId,
      'clinic_name': clinicName,
      'leave_type': leaveType,
      'from_date': fromDate,
      'to_date': toDate,
      if (daysType != null) 'leave_duration': daysType,
      'total_days': totalDays,
      'reason': reason,
      'status': status,
      'applied_at': appliedAt,
      'reviewed_at': reviewedAt,
      'reviewed_by': reviewedBy,
      'reviewed_by_name': reviewedByName,
      'review_notes': reviewNotes,
      'created_at': createdAt,
    };
  }
}
