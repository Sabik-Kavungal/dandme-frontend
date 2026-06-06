class ClinicDashboardResponse {
  final bool success;
  final ClinicDashboardData data;

  ClinicDashboardResponse({
    required this.success,
    required this.data,
  });

  factory ClinicDashboardResponse.fromJson(Map<String, dynamic> json) {
    return ClinicDashboardResponse(
      success: json['success'] ?? false,
      data: ClinicDashboardData.fromJson(json['data'] ?? {}),
    );
  }
}

class ClinicDashboardData {
  final int totalAppointments;
  final String totalAppointmentsTrend;
  final double totalRevenue;
  final String totalRevenueTrend;
  final CompletedAppointmentsData completedAppointments;
  final PatientsActivityData patientsActivity;
  final List<DashboardDoctorData> doctorsList;

  ClinicDashboardData({
    required this.totalAppointments,
    required this.totalAppointmentsTrend,
    required this.totalRevenue,
    required this.totalRevenueTrend,
    required this.completedAppointments,
    required this.patientsActivity,
    required this.doctorsList,
  });

  factory ClinicDashboardData.fromJson(Map<String, dynamic> json) {
    return ClinicDashboardData(
      totalAppointments: json['total_appointments'] ?? 0,
      totalAppointmentsTrend: json['total_appointments_trend'] ?? '',
      totalRevenue: (json['total_revenue'] ?? 0).toDouble(),
      totalRevenueTrend: json['total_revenue_trend'] ?? '',
      completedAppointments: CompletedAppointmentsData.fromJson(json['completed_appointments'] ?? {}),
      patientsActivity: PatientsActivityData.fromJson(json['patients_activity'] ?? {}),
      doctorsList: (json['doctors_list'] as List<dynamic>?)
              ?.map((e) => DashboardDoctorData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class PatientsActivityData {
  final int total;
  final int newPatients;
  final int returning;

  PatientsActivityData({
    required this.total,
    required this.newPatients,
    required this.returning,
  });

  factory PatientsActivityData.fromJson(Map<String, dynamic> json) {
    return PatientsActivityData(
      total: json['total'] ?? 0,
      newPatients: json['new'] ?? 0,
      returning: json['returning'] ?? 0,
    );
  }
}

class CompletedAppointmentsData {
  final int total;
  final String trend;
  final int clinicVisits;
  final int onlineVisits;
  final int other;

  CompletedAppointmentsData({
    required this.total,
    required this.trend,
    required this.clinicVisits,
    required this.onlineVisits,
    required this.other,
  });

  factory CompletedAppointmentsData.fromJson(Map<String, dynamic> json) {
    return CompletedAppointmentsData(
      total: json['total'] ?? 0,
      trend: json['trend'] ?? '',
      clinicVisits: json['clinic_visits'] ?? 0,
      onlineVisits: json['online_visits'] ?? 0,
      other: json['other'] ?? 0,
    );
  }
}

class DashboardDoctorData {
  final String doctorId;
  final String doctorName;
  final String doctorImage;
  final int totalAppointments;
  final int completed;
  final double revenue;

  DashboardDoctorData({
    required this.doctorId,
    required this.doctorName,
    required this.doctorImage,
    required this.totalAppointments,
    required this.completed,
    required this.revenue,
  });

  factory DashboardDoctorData.fromJson(Map<String, dynamic> json) {
    return DashboardDoctorData(
      doctorId: json['doctor_id'] ?? '',
      doctorName: json['doctor_name'] ?? '',
      doctorImage: json['doctor_image'] ?? '',
      totalAppointments: json['total_appointments'] ?? 0,
      completed: json['completed'] ?? 0,
      revenue: (json['revenue'] ?? 0).toDouble(),
    );
  }
}
