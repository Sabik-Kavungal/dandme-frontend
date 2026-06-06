class ReceiptModel {
  final String receiptNumber;
  final String appointmentId;
  final String bookingNumber;
  final String patientName;
  final String patientAge;
  final String patientGender;
  final String? patientPhone;
  final String doctorName;
  final String department;
  final String clinicName;
  final String clinicAddress;
  final String clinicPhone;
  final String tokenNumber;
  final String consultationType;
  final String appointmentDate;
  final String appointmentTime;
  final String visitMode;
  final String bookingType;
  final String paymentMethod;
  final String transactionId;
  final double consultationFee;
  final double additionalCharges;
  final double discount;
  final double tax;
  final double totalAmount;
  final String paymentStatus;
  final String bookingStatus;
  final DateTime generatedAt;
  final String? clinicLogoUrl;

  const ReceiptModel({
    required this.receiptNumber,
    required this.appointmentId,
    required this.bookingNumber,
    required this.patientName,
    required this.patientAge,
    required this.patientGender,
    this.patientPhone,
    required this.doctorName,
    required this.department,
    required this.clinicName,
    required this.clinicAddress,
    required this.clinicPhone,
    required this.tokenNumber,
    required this.consultationType,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.visitMode,
    required this.bookingType,
    required this.paymentMethod,
    required this.transactionId,
    required this.consultationFee,
    required this.additionalCharges,
    required this.discount,
    required this.tax,
    required this.totalAmount,
    required this.paymentStatus,
    required this.bookingStatus,
    required this.generatedAt,
    this.clinicLogoUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'receiptNumber': receiptNumber,
      'appointmentId': appointmentId,
      'bookingNumber': bookingNumber,
      'patientName': patientName,
      'patientAge': patientAge,
      'patientGender': patientGender,
      'patientPhone': patientPhone,
      'doctorName': doctorName,
      'department': department,
      'clinicName': clinicName,
      'clinicAddress': clinicAddress,
      'clinicPhone': clinicPhone,
      'tokenNumber': tokenNumber,
      'consultationType': consultationType,
      'appointmentDate': appointmentDate,
      'appointmentTime': appointmentTime,
      'visitMode': visitMode,
      'bookingType': bookingType,
      'paymentMethod': paymentMethod,
      'transactionId': transactionId,
      'consultationFee': consultationFee,
      'additionalCharges': additionalCharges,
      'discount': discount,
      'tax': tax,
      'totalAmount': totalAmount,
      'paymentStatus': paymentStatus,
      'bookingStatus': bookingStatus,
      'generatedAt': generatedAt.toIso8601String(),
      'clinicLogoUrl': clinicLogoUrl,
    };
  }

  factory ReceiptModel.fromJson(Map<String, dynamic> json) {
    return ReceiptModel(
      receiptNumber: json['receiptNumber'] ?? '',
      appointmentId: json['appointmentId'] ?? '',
      bookingNumber: json['bookingNumber'] ?? '',
      patientName: json['patientName'] ?? '',
      patientAge: json['patientAge'] ?? 'N/A',
      patientGender: json['patientGender'] ?? 'N/A',
      patientPhone: json['patientPhone'],
      doctorName: json['doctorName'] ?? '',
      department: json['department'] ?? '',
      clinicName: json['clinicName'] ?? '',
      clinicAddress: json['clinicAddress'] ?? '',
      clinicPhone: json['clinicPhone'] ?? '',
      tokenNumber: json['tokenNumber'] ?? '',
      consultationType: json['consultationType'] ?? '',
      appointmentDate: json['appointmentDate'] ?? '',
      appointmentTime: json['appointmentTime'] ?? '',
      visitMode: json['visitMode'] ?? 'In-Clinic',
      bookingType: json['bookingType'] ?? 'Fresh',
      paymentMethod: json['paymentMethod'] ?? '',
      transactionId: json['transactionId'] ?? '',
      consultationFee: (json['consultationFee'] as num?)?.toDouble() ?? 0.0,
      additionalCharges: (json['additionalCharges'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
      paymentStatus: json['paymentStatus'] ?? '',
      bookingStatus: json['bookingStatus'] ?? '',
      generatedAt: json['generatedAt'] != null 
          ? DateTime.parse(json['generatedAt']) 
          : DateTime.now(),
      clinicLogoUrl: json['clinicLogoUrl'],
    );
  }
}
