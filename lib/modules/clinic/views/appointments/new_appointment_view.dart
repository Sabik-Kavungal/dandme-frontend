// import 'package:a/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';
// import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
// import 'package:a/modules/clinic/models/clinic_patient_model.dart'; // ✅ Import for extension methods
// import 'package:a/modules/clinic/models/doctor_time_slot_model.dart';
// import 'package:a/modules/clinic/models/payment_method_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'payment_confirmation_popup.dart';

// class NewAppointmentScreen extends StatefulWidget {
//   const NewAppointmentScreen({super.key});

//   @override
//   State<NewAppointmentScreen> createState() => _NewAppointmentScreenState();
// }

// class _NewAppointmentScreenState extends State<NewAppointmentScreen> {
//   late NewAppointmentViewModel _viewModel;
//   final TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _viewModel = NewAppointmentViewModel(
//       Provider.of<AuthViewModel>(context, listen: false),
//     );
//     _viewModel.initialize();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider.value(
//       value: _viewModel,
//       child: Consumer<NewAppointmentViewModel>(
//         builder: (context, viewModel, child) {
//           return Scaffold(
//             backgroundColor: const Color(0xFFF8F8F8),
//             body: LayoutBuilder(
//               builder: (context, constraints) {
//                 // Responsive scaling for big screens
//                 final isLargeScreen = constraints.maxWidth > 1200;
//                 final scaleFactor = isLargeScreen ? 0.9 : 1.0;

//                 return LayoutBuilder(
//                   builder: (context, constraints) {
//                     final isMobile = constraints.maxWidth < 480;

//                     if (isMobile) {
//                       return _buildMobileLayout(viewModel, scaleFactor);
//                     } else {
//                       return _buildWebLayout(viewModel, scaleFactor);
//                     }
//                   },
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildMobileLayout(
//     NewAppointmentViewModel viewModel,
//     double scaleFactor,
//   ) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Appointments Title

//           // New Appointments Title
//           Text(
//             'New Appointments',
//             style: TextStyle(
//               fontSize: 18 * scaleFactor,
//               fontWeight: FontWeight.bold,
//               color: const Color(0xFF333333),
//             ),
//           ),
//           SizedBox(height: 16 * scaleFactor),

//           // Consultation Details Section
//           _buildMobileConsultationDetailsSection(viewModel, scaleFactor),
//           SizedBox(height: 14 * scaleFactor),

//           // Available Slots Section
//           _buildMobileAvailableSlotsSection(viewModel, scaleFactor),
//           SizedBox(height: 14 * scaleFactor),

//           // Search Patient Section
//           _buildMobileSearchPatientSection(viewModel, scaleFactor),
//           SizedBox(height: 14 * scaleFactor),

//           // ✅ Only HIDE payment for FREE follow-ups (in eligible_follow_ups array)
//           // SHOW payment for: Regular appointments, PAID follow-ups (free already used/expired)
//           if (!(viewModel.selectedConsultationType.startsWith('follow-up') &&
//               viewModel.selectedClinicPatient != null &&
//               viewModel.selectedDoctorObject != null &&
//               viewModel.selectedClinicPatient!.isEligibleFor(
//                 doctorId: viewModel.selectedDoctorObject!.doctorId!,
//                 departmentId: viewModel.selectedDepartmentId,
//               ))) ...[
//             // Payment Method Section
//             _buildMobilePaymentMethodSection(viewModel, scaleFactor),
//             SizedBox(height: 14 * scaleFactor),
//           ],

//           // Book Now Button
//           _buildMobileBookNowButton(viewModel, scaleFactor),
//           SizedBox(height: 20 * scaleFactor),

//           // Footer
//           _buildFooter(),
//         ],
//       ),
//     );
//   }

//   Widget _buildWebLayout(
//     NewAppointmentViewModel viewModel,
//     double scaleFactor,
//   ) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16 * scaleFactor),
//       child: Container(
//         padding: EdgeInsets.all(16 * scaleFactor),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 10,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // New Appointments Title
//             Text(
//               'New Appointments',
//               style: TextStyle(
//                 fontSize: 24 * scaleFactor,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xFF333333),
//               ),
//             ),
//             SizedBox(height: 12 * scaleFactor),
//             Divider(color: const Color(0xFFE0E0E0), thickness: 1),
//             SizedBox(height: 12 * scaleFactor),

//             // Consultation Details Section
//             _buildConsultationDetailsSection(scaleFactor, viewModel),
//             SizedBox(height: 10 * scaleFactor),
//             Divider(color: const Color(0xFFE0E0E0), thickness: 1),
//             SizedBox(height: 10 * scaleFactor),

//             // Available Slots Section
//             _buildAvailableSlotsSection(scaleFactor, viewModel),
//             SizedBox(height: 10 * scaleFactor),
//             Divider(color: const Color(0xFFE0E0E0), thickness: 1),
//             SizedBox(height: 10 * scaleFactor),

//             // Search Patient Section
//             _buildSearchPatientSection(scaleFactor, viewModel),
//             SizedBox(height: 8 * scaleFactor),

//             // ✅ Only HIDE payment for FREE follow-ups (in eligible_follow_ups array)
//             // SHOW payment for: Regular appointments, PAID follow-ups (free already used/expired)
//             if (!(viewModel.selectedConsultationType.startsWith('follow-up') &&
//                 viewModel.selectedClinicPatient != null &&
//                 viewModel.selectedDoctorObject != null &&
//                 viewModel.selectedClinicPatient!.isEligibleFor(
//                   doctorId: viewModel.selectedDoctorObject!.doctorId!,
//                   departmentId: viewModel.selectedDepartmentId,
//                 ))) ...[
//               Divider(color: const Color(0xFFE0E0E0), thickness: 1),
//               SizedBox(height: 8 * scaleFactor),
//               // Payment Method Section
//               _buildPaymentMethodSection(scaleFactor, viewModel),
//               SizedBox(height: 8 * scaleFactor),
//             ],

//             // Book Now Button
//             _buildBookNowButton(scaleFactor, viewModel),
//             SizedBox(height: 16 * scaleFactor),

//             // Footer
//             _buildFooter(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildConsultationDetailsSection(
//     double scaleFactor,
//     NewAppointmentViewModel viewModel,
//   ) {
//     // ✅ Dropdowns are always enabled - user selects doctor/department first, then patient
//     // Validation happens when patient is selected

//     return Row(
//       children: [
//         Expanded(
//           child: _buildDropdownField(
//             'consultation type',
//             viewModel.selectedConsultationType,
//             (value) => viewModel.setConsultationType(value!),
//             scaleFactor,
//             viewModel.consultationTypesList,
//           ),
//         ),
//         SizedBox(width: 6 * scaleFactor),
//         Expanded(
//           child: _buildDropdownField(
//             'Select Department',
//             viewModel.selectedDepartment,
//             (value) => viewModel.setDepartment(value!),
//             scaleFactor,
//             viewModel.departments
//                 .map((dept) => dept.name ?? 'Orthology')
//                 .toList(),
//           ),
//         ),
//         SizedBox(width: 6 * scaleFactor),
//         Expanded(
//           child: _buildDropdownField(
//             'Select Doctor',
//             viewModel.selectedDoctor,
//             (value) => viewModel.setDoctor(value!),
//             scaleFactor,
//             viewModel.clinicDoctors.isEmpty
//                 ? ['Loading...']
//                 : viewModel.clinicDoctors
//                       .map(
//                         (doctor) =>
//                             doctor.fullName ??
//                             '${doctor.firstName} ${doctor.lastName}',
//                       )
//                       .toList(),
//           ),
//         ),
//         SizedBox(width: 6 * scaleFactor),
//         Expanded(
//           child: _buildTextField(
//             'Reason or Add Notes',
//             'Add Patient Note',
//             scaleFactor,
//             viewModel.patientNotes,
//             (value) => viewModel.setPatientNotes(value),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildAvailableSlotsSection(
//     double scaleFactor,
//     NewAppointmentViewModel viewModel,
//   ) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 10,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       padding: EdgeInsets.all(14 * scaleFactor),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Select Date Heading with Date Picker Button
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Icon(
//                     Icons.calendar_month,
//                     size: 18 * scaleFactor,
//                     color: const Color(0xFF007BFF),
//                   ),
//                   SizedBox(width: 6 * scaleFactor),
//                   Text(
//                     'Select Date',
//                     style: TextStyle(
//                       fontSize: 13 * scaleFactor,
//                       fontWeight: FontWeight.w600,
//                       color: const Color(0xFF2C3E50),
//                       letterSpacing: 0.3,
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Color(0xFF007BFF), Color(0xFF0056B3)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(6),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Color(0xFF007BFF).withOpacity(0.25),
//                       blurRadius: 6,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: ElevatedButton.icon(
//                   onPressed: () => _showDatePickerDialog(context, viewModel),
//                   icon: Icon(Icons.calendar_today, size: 14 * scaleFactor),
//                   label: Text(
//                     'Pick Date',
//                     style: TextStyle(
//                       fontSize: 12 * scaleFactor,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.transparent,
//                     foregroundColor: Colors.white,
//                     shadowColor: Colors.transparent,
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 10 * scaleFactor,
//                       vertical: 6 * scaleFactor,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     elevation: 0,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 10 * scaleFactor),

//           // Horizontal Date Selector
//           _buildHorizontalDateSelector(viewModel, scaleFactor),

//           SizedBox(height: 14 * scaleFactor),

//           // Available Slots Heading with icon
//           Row(
//             children: [
//               Icon(
//                 Icons.schedule,
//                 size: 18 * scaleFactor,
//                 color: const Color(0xFF28A745),
//               ),
//               SizedBox(width: 6 * scaleFactor),
//               Text(
//                 'Available Slots',
//                 style: TextStyle(
//                   fontSize: 14 * scaleFactor,
//                   fontWeight: FontWeight.w600,
//                   color: const Color(0xFF2C3E50),
//                   letterSpacing: 0.3,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 10 * scaleFactor),

//           // Time Slots from API
//           if (viewModel.isLoadingSlots)
//             Center(
//               child: Padding(
//                 padding: EdgeInsets.all(12 * scaleFactor),
//                 child: CircularProgressIndicator(),
//               ),
//             )
//           else if (viewModel.groupedTimeSlots == null ||
//               (viewModel.groupedTimeSlots!.days.isEmpty) ||
//               (viewModel.groupedTimeSlots!.days.every((day) => !day.hasSlots)))
//             Center(
//               child: Padding(
//                 padding: EdgeInsets.all(12 * scaleFactor),
//                 child: Text(
//                   'No time slots available for this date.',
//                   style: TextStyle(
//                     fontSize: 13 * scaleFactor,
//                     color: const Color(0xFF666666),
//                   ),
//                 ),
//               ),
//             )
//           else
//             ..._buildDynamicTimeSlotSections(viewModel, scaleFactor),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearchPatientSection(
//     double scaleFactor,
//     NewAppointmentViewModel viewModel,
//   ) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 10,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       padding: EdgeInsets.all(14 * scaleFactor),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(
//                 Icons.person_search,
//                 size: 18 * scaleFactor,
//                 color: const Color(0xFF6C757D),
//               ),
//               SizedBox(width: 6 * scaleFactor),
//               Text(
//                 'Search Patient',
//                 style: TextStyle(
//                   fontSize: 14 * scaleFactor,
//                   fontWeight: FontWeight.w600,
//                   color: const Color(0xFF2C3E50),
//                   letterSpacing: 0.3,
//                 ),
//               ),
//               Spacer(),
//               // ✅ NEW: Refresh button to update follow-up eligibility
//               if (viewModel.lastPatientSearchQuery.isNotEmpty)
//                 Tooltip(
//                   message: 'Refresh follow-up status',
//                   child: IconButton(
//                     icon: Icon(
//                       Icons.refresh,
//                       size: 18 * scaleFactor,
//                       color: const Color(0xFF007BFF),
//                     ),
//                     onPressed: () {
//                       viewModel.refreshPatientSearch();
//                     },
//                     padding: EdgeInsets.all(4 * scaleFactor),
//                     constraints: BoxConstraints(),
//                   ),
//                 ),
//             ],
//           ),
//           SizedBox(height: 8 * scaleFactor),
//           Row(
//             children: [
//               // Radio Buttons
//               Row(
//                 children: [
//                   Radio<bool>(
//                     value: true,
//                     groupValue: viewModel.isMobileSearch,
//                     onChanged: (value) => viewModel.setSearchType(value!),
//                     activeColor: const Color(0xFF007BFF),
//                   ),
//                   Text(
//                     'Mobile No',
//                     style: TextStyle(fontSize: 13 * scaleFactor),
//                   ),
//                   SizedBox(width: 8 * scaleFactor),
//                   Radio<bool>(
//                     value: false,
//                     groupValue: viewModel.isMobileSearch,
//                     onChanged: (value) => viewModel.setSearchType(value!),
//                     activeColor: const Color(0xFF007BFF),
//                   ),
//                   Text('Mo ID', style: TextStyle(fontSize: 13 * scaleFactor)),
//                 ],
//               ),
//               SizedBox(width: 8 * scaleFactor),
//               // Search Input
//               Expanded(
//                 child: Container(
//                   height: 35 * scaleFactor,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: const Color(0xFFE0E0E0)),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: TextField(
//                     controller: searchController,
//                     onChanged: (value) => viewModel.setSearchQuery(value),
//                     decoration: InputDecoration(
//                       hintText: '123-123-123',
//                       hintStyle: TextStyle(
//                         color: const Color(0xFF999999),
//                         fontSize: 13 * scaleFactor,
//                       ),
//                       suffixIcon: Icon(
//                         Icons.search,
//                         color: const Color(0xFF666666),
//                         size: 18 * scaleFactor,
//                       ),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(
//                         horizontal: 10 * scaleFactor,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 8 * scaleFactor),
//               // Add New Patient Button
//               OutlinedButton.icon(
//                 onPressed: () =>
//                     _showQuickPatientRegistrationDialog(context, viewModel),
//                 style: OutlinedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   foregroundColor: const Color(0xFF333333),
//                   side: const BorderSide(color: Color(0xFFE0E0E0)),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 12 * scaleFactor,
//                     vertical: 6 * scaleFactor,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                 ),
//                 icon: Icon(
//                   Icons.add,
//                   size: 14 * scaleFactor,
//                   color: const Color(0xFFE53935),
//                 ),
//                 label: Text(
//                   'Add New Patient',
//                   style: TextStyle(fontSize: 13 * scaleFactor),
//                 ),
//               ),
//             ],
//           ),
//           // Search Results
//           if (viewModel.clinicPatientSearchResults.isNotEmpty) ...[
//             SizedBox(height: 4 * scaleFactor),
//             Container(
//               constraints: BoxConstraints(maxHeight: 200 * scaleFactor),
//               decoration: BoxDecoration(
//                 color: Colors.grey[50],
//                 borderRadius: BorderRadius.circular(6),
//                 border: Border.all(color: Colors.grey[300]!),
//               ),
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: viewModel.clinicPatientSearchResults.length,
//                 itemBuilder: (context, index) {
//                   final patient = viewModel.clinicPatientSearchResults[index];

//                   // ✅ DEBUG: Print patient data for troubleshooting
//                   if (index == 0) {
//                     print('📋 Patient Card Rendering:');
//                     print(
//                       '   Patient: ${patient.firstName} ${patient.lastName}',
//                     );
//                     print(
//                       '   Total appointments: ${patient.appointments.length}',
//                     );
//                     print(
//                       '   Total eligibleFollowUps: ${patient.eligibleFollowUps.length}',
//                     );
//                     if (patient.eligibleFollowUps.isNotEmpty) {
//                       for (var f in patient.eligibleFollowUps) {
//                         print(
//                           '      - ${f.doctorName} (${f.department}) - ${f.remainingDays} days',
//                         );
//                       }
//                     }
//                   }

//                   // ✅ FIXED: Only calculate status for SELECTED patient
//                   final isFollowUpType = viewModel.selectedConsultationType
//                       .startsWith('follow-up');

//                   // Check if this patient is selected
//                   final isSelected =
//                       viewModel.selectedClinicPatient?.id == patient.id;

//                   // ✅ Selection logic verified - debug logging removed

//                   // ✅ Calculate follow-up status ONLY for selected patient
//                   String followUpStatus = 'regular';
//                   if (isFollowUpType &&
//                       viewModel.selectedDoctorObject != null &&
//                       isSelected) {
//                     // Only check status for selected patient!
//                     followUpStatus = patient.getFollowUpStatus(
//                       doctorId: viewModel.selectedDoctorObject!.doctorId!,
//                       departmentId: viewModel.selectedDepartmentId,
//                     );

//                     // Status calculated for selected patient only
//                   }

//                   // ✅ FIXED: Follow-up flags ONLY for selected patient
//                   final isFreeFollowUp =
//                       isFollowUpType && isSelected && followUpStatus == 'free';
//                   final isPaidFollowUp =
//                       isFollowUpType &&
//                       isSelected &&
//                       followUpStatus == 'paid_expired';
//                   final noAppointment =
//                       isFollowUpType &&
//                       isSelected &&
//                       followUpStatus == 'no_appointment';
//                   final alreadyUsed =
//                       isFollowUpType &&
//                       isSelected &&
//                       followUpStatus == 'already_used';

//                   // ✅ FIXED: Determine avatar color ONLY for selected patient
//                   // Search results: Always blue (no status calculated)
//                   // Selected patient: Color-coded (status verified)
//                   Color avatarColor;

//                   if (isFollowUpType && isSelected) {
//                     // Follow-up mode + patient selected: Color-code by eligibility
//                     if (isFreeFollowUp) {
//                       avatarColor = Colors.green; // 🟢 FREE
//                       if (index < 3) print('   → Avatar Color: GREEN (free)');
//                     } else if (alreadyUsed) {
//                       avatarColor =
//                           Colors.red; // 🔴 ALREADY USED (fraud prevention)
//                       if (index < 3) print('   → Avatar Color: RED (used)');
//                     } else if (isPaidFollowUp) {
//                       avatarColor = Colors.orange; // 🟠 PAID
//                       if (index < 3) print('   → Avatar Color: ORANGE (paid)');
//                     } else if (noAppointment) {
//                       avatarColor = Colors.grey; // ⚪ No appointment
//                       if (index < 3) print('   → Avatar Color: GREY (no appt)');
//                     } else {
//                       avatarColor = Colors.blue; // Default
//                       if (index < 3) print('   → Avatar Color: BLUE (default)');
//                     }
//                   } else {
//                     // Search results OR regular mode: Always blue
//                     avatarColor = Colors.blue;
//                     if (index < 3 && isFollowUpType) {
//                       print('   → Avatar Color: BLUE (unselected)');
//                       print(
//                         '   → Reason: isFollowUpType=$isFollowUpType, isSelected=$isSelected',
//                       );
//                     }
//                   }

//                   // ✅ SIMPLIFIED: Get last visit date
//                   String? lastVisitDate;
//                   if (patient.eligibleFollowUps.isNotEmpty) {
//                     lastVisitDate = patient.eligibleFollowUps.first.dateString;
//                   } else if (patient.appointments.isNotEmpty) {
//                     lastVisitDate = patient.appointments.first.appointmentDate;
//                   } else if (patient.lastAppointment != null) {
//                     lastVisitDate = patient.lastAppointment!.date;
//                   }

//                   return ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: avatarColor,
//                       child: Text(
//                         patient.firstName[0].toUpperCase(),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     title: Text(
//                       '${patient.firstName} ${patient.lastName}',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14,
//                       ),
//                     ),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Phone number
//                         Text(
//                           '📞 ${patient.phone}',
//                           style: TextStyle(fontSize: 12),
//                         ),
//                         // Last visit date with follow-up indicator
//                         if (lastVisitDate != null)
//                           Row(
//                             children: [
//                               Text(
//                                 '📅 Last Visit: $lastVisitDate',
//                                 style: TextStyle(
//                                   fontSize: 11,
//                                   color: Colors.grey[600],
//                                 ),
//                               ),
//                               // ✅ User-friendly "Follow-Up" indicator
//                               if (patient.eligibleFollowUps.isNotEmpty)
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 8),
//                                   child: Container(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 6,
//                                       vertical: 2,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: Colors.blue.shade50,
//                                       borderRadius: BorderRadius.circular(8),
//                                       border: Border.all(
//                                         color: Colors.blue.shade200,
//                                         width: 1,
//                                       ),
//                                     ),
//                                     child: Text(
//                                       'Follow-Up',
//                                       style: TextStyle(
//                                         fontSize: 9,
//                                         color: Colors.blue[700],
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         // ✅ Follow-up status with remaining days for search results
//                         if (isFollowUpType &&
//                             viewModel.selectedDoctorObject != null)
//                           Padding(
//                             padding: const EdgeInsets.only(top: 4),
//                             child: Builder(
//                               builder: (context) {
//                                 final status = patient.getFollowUpStatus(
//                                   doctorId:
//                                       viewModel.selectedDoctorObject!.doctorId!,
//                                   departmentId: viewModel.selectedDepartmentId,
//                                 );

//                                 String statusText;
//                                 Color statusColor;

//                                 // ✅ FIXED: Use same logic as selected patient card
//                                 final isTrulyFree = patient.isEligibleFor(
//                                   doctorId:
//                                       viewModel.selectedDoctorObject!.doctorId!,
//                                   departmentId: viewModel.selectedDepartmentId,
//                                 );

//                                 switch (status) {
//                                   case 'free':
//                                     if (isTrulyFree) {
//                                       // ✅ TRULY FREE: Show with remaining days
//                                       if (patient
//                                           .eligibleFollowUps
//                                           .isNotEmpty) {
//                                         final eligibleFollowUp = patient
//                                             .eligibleFollowUps
//                                             .firstWhere(
//                                               (f) =>
//                                                   f.doctorId ==
//                                                       viewModel
//                                                           .selectedDoctorObject!
//                                                           .doctorId! &&
//                                                   f.departmentId ==
//                                                       viewModel
//                                                           .selectedDepartmentId,
//                                               orElse: () => patient
//                                                   .eligibleFollowUps
//                                                   .first,
//                                             );
//                                         statusText =
//                                             '🟢 Free Follow-Up Eligible (${eligibleFollowUp.daysLeft} days)';
//                                       } else {
//                                         statusText =
//                                             '🟢 Free Follow-Up Eligible';
//                                       }
//                                       statusColor = Colors.green[700]!;
//                                     } else {
//                                       // ✅ NOT TRULY FREE: Show as paid
//                                       statusText = '🟠 Paid Follow-Up Required';
//                                       statusColor = Colors.orange[700]!;
//                                     }
//                                     break;
//                                   case 'already_used':
//                                     statusText =
//                                         '🔴 Free Follow-Up Already Used';
//                                     statusColor = Colors.red[700]!;
//                                     break;
//                                   case 'paid_expired':
//                                     statusText = '🟠 Paid Follow-Up Required';
//                                     statusColor = Colors.orange[700]!;
//                                     break;
//                                   case 'no_appointment':
//                                     statusText =
//                                         '⚪ No Previous Appointment Found';
//                                     statusColor = Colors.grey[700]!;
//                                     break;
//                                   default:
//                                     statusText =
//                                         '⚪ No Previous Appointment Found';
//                                     statusColor = Colors.grey[700]!;
//                                 }

//                                 return Text(
//                                   statusText,
//                                   style: TextStyle(
//                                     fontSize: 11,
//                                     color: statusColor,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                       ],
//                     ),
//                     // ✅ Disable tap if no previous appointment
//                     onTap: () {
//                       // Check if follow-up type and no previous appointment
//                       if (isFollowUpType &&
//                           viewModel.selectedDoctorObject != null) {
//                         final status = patient.getFollowUpStatus(
//                           doctorId: viewModel.selectedDoctorObject!.doctorId!,
//                           departmentId: viewModel.selectedDepartmentId,
//                         );

//                         if (status == 'no_appointment') {
//                           // ❌ Block selection - show error
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text(
//                                 '❌ Cannot book follow-up: Patient has no previous appointment with the selected doctor and department.\n\nPlease book a regular appointment first.',
//                               ),
//                               backgroundColor: Colors.red,
//                               duration: Duration(seconds: 4),
//                             ),
//                           );
//                           return; // Don't select patient
//                         }
//                       }

//                       // ✅ Allow selection for other cases
//                       viewModel.selectClinicPatient(patient);
//                     },
//                     // ✅ Disable visual feedback if no appointment
//                     enabled:
//                         !(isFollowUpType &&
//                             viewModel.selectedDoctorObject != null &&
//                             patient.getFollowUpStatus(
//                                   doctorId:
//                                       viewModel.selectedDoctorObject!.doctorId!,
//                                   departmentId: viewModel.selectedDepartmentId,
//                                 ) ==
//                                 'no_appointment'),
//                   );
//                 },
//               ),
//             ),
//           ],
//           // ✅ SIMPLIFIED: Selected Patient Card (Compact)
//           if (viewModel.selectedClinicPatient != null) ...[
//             SizedBox(height: 8 * scaleFactor),
//             Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 12 * scaleFactor,
//                 vertical: 8 * scaleFactor,
//               ),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFE3F2FD), // Light blue background
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 children: [
//                   // Avatar
//                   CircleAvatar(
//                     radius: 16 * scaleFactor,
//                     backgroundColor: Colors.blue,
//                     child: Text(
//                       viewModel.selectedClinicPatient!.firstName[0]
//                           .toUpperCase(),
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 14 * scaleFactor,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10 * scaleFactor),
//                   // Patient info
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '${viewModel.selectedClinicPatient!.firstName} ${viewModel.selectedClinicPatient!.lastName}',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 13 * scaleFactor,
//                           ),
//                         ),
//                         Text(
//                           '📞 ${viewModel.selectedClinicPatient!.phone}',
//                           style: TextStyle(
//                             fontSize: 11 * scaleFactor,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // ✅ Status badge (free/paid) - only in follow-up mode
//                   if (viewModel.selectedConsultationType.startsWith(
//                         'follow-up',
//                       ) &&
//                       viewModel.selectedDoctorObject != null)
//                     Builder(
//                       builder: (context) {
//                         // ✅ FIXED: Check if payment is actually hidden (truly free)
//                         final isTrulyFree = viewModel.selectedClinicPatient!
//                             .isEligibleFor(
//                               doctorId:
//                                   viewModel.selectedDoctorObject!.doctorId!,
//                               departmentId: viewModel.selectedDepartmentId,
//                             );

//                         final status = viewModel.selectedClinicPatient!
//                             .getFollowUpStatus(
//                               doctorId:
//                                   viewModel.selectedDoctorObject!.doctorId!,
//                               departmentId: viewModel.selectedDepartmentId,
//                             );

//                         // Determine badge appearance based on actual payment requirement
//                         Color badgeColor;
//                         String badgeText;

//                         if (isTrulyFree && status == 'free') {
//                           // ✅ FREE: Payment hidden
//                           badgeColor = const Color(0xFFE8F5E9); // Light green
//                           badgeText = '🟢 Free';
//                         } else if (status == 'already_used') {
//                           // 🔴 USED: Payment required (fraud prevention)
//                           badgeColor = const Color(0xFFFFEBEE); // Light red
//                           badgeText = '🔴 Used';
//                         } else if (status == 'paid_expired' || !isTrulyFree) {
//                           // 🟠 PAID: Payment required (expired or not in eligible_follow_ups)
//                           badgeColor = const Color(0xFFFFF3E0); // Light orange
//                           badgeText = '🟠 Paid';
//                         } else if (status == 'no_appointment') {
//                           // ⚪ NO APPOINTMENT: Cannot book
//                           badgeColor = const Color(0xFFF5F5F5); // Light grey
//                           badgeText = '⚪ None';
//                         } else {
//                           return SizedBox.shrink(); // No badge
//                         }

//                         return Container(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 8 * scaleFactor,
//                             vertical: 4 * scaleFactor,
//                           ),
//                           decoration: BoxDecoration(
//                             color: badgeColor,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Text(
//                             badgeText,
//                             style: TextStyle(
//                               fontSize: 10 * scaleFactor,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   // Close button
//                   IconButton(
//                     icon: Icon(Icons.close, size: 18 * scaleFactor),
//                     onPressed: () {
//                       viewModel.deselectClinicPatient();
//                     },
//                     padding: EdgeInsets.zero,
//                     constraints: BoxConstraints(),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }

//   Widget _buildPaymentMethodSection(
//     double scaleFactor,
//     NewAppointmentViewModel viewModel,
//   ) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 10,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       padding: EdgeInsets.all(14 * scaleFactor),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(
//                 Icons.payment,
//                 size: 18 * scaleFactor,
//                 color: const Color(0xFF28A745),
//               ),
//               SizedBox(width: 6 * scaleFactor),
//               Text(
//                 'Payment Method',
//                 style: TextStyle(
//                   fontSize: 14 * scaleFactor,
//                   fontWeight: FontWeight.w600,
//                   color: const Color(0xFF2C3E50),
//                   letterSpacing: 0.3,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 8 * scaleFactor),
//           // Payment Method Selection
//           Wrap(
//             spacing: 8 * scaleFactor,
//             runSpacing: 8 * scaleFactor,
//             children: PaymentMethodOptions.allMethods.map((method) {
//               final isSelected = viewModel.selectedPaymentMethodEnum == method;
//               return GestureDetector(
//                 onTap: () {
//                   viewModel.setPaymentMethodEnum(method);
//                 },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 12 * scaleFactor,
//                     vertical: 8 * scaleFactor,
//                   ),
//                   decoration: BoxDecoration(
//                     color: isSelected
//                         ? Colors.blue.shade50
//                         : Colors.grey.shade50,
//                     border: Border.all(
//                       color: isSelected ? Colors.blue : Colors.grey.shade300,
//                       width: isSelected ? 2 : 1,
//                     ),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         method.methodIcon,
//                         style: TextStyle(fontSize: 16 * scaleFactor),
//                       ),
//                       SizedBox(width: 4 * scaleFactor),
//                       Text(
//                         method.displayName,
//                         style: TextStyle(
//                           fontSize: 13 * scaleFactor,
//                           fontWeight: isSelected
//                               ? FontWeight.w600
//                               : FontWeight.normal,
//                           color: isSelected
//                               ? Colors.blue.shade700
//                               : Colors.grey.shade700,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBookNowButton(
//     double scaleFactor,
//     NewAppointmentViewModel viewModel,
//   ) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: ElevatedButton(
//         onPressed: viewModel.isCreating
//             ? null
//             : () async {
//                 // Validate required selections
//                 if (viewModel.selectedClinicPatient == null) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('❌ Please select a patient'),
//                       backgroundColor: Colors.red,
//                       duration: Duration(seconds: 3),
//                     ),
//                   );
//                   return;
//                 }

//                 if (viewModel.selectedDoctor.isEmpty) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('❌ Please select a doctor'),
//                       backgroundColor: Colors.red,
//                       duration: Duration(seconds: 3),
//                     ),
//                   );
//                   return;
//                 }

//                 if (viewModel.selectedSlotDetails == null) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('❌ Please select a time slot'),
//                       backgroundColor: Colors.red,
//                       duration: Duration(seconds: 3),
//                     ),
//                   );
//                   return;
//                 }

//                 // ✅ Check if FREE follow-up (no payment needed)
//                 final isFreeFollowUp =
//                     viewModel.selectedConsultationType.startsWith(
//                       'follow-up',
//                     ) &&
//                     (viewModel
//                             .selectedClinicPatient
//                             ?.followUpEligibility
//                             ?.isFree ??
//                         false);

//                 // ✅ For FREE follow-up, create directly (no payment required)
//                 if (isFreeFollowUp) {
//                   final result = await viewModel.createSimpleAppointment();
//                   if (result != null && mounted) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(
//                           '✅ Follow-up appointment created successfully! Token: #${result.appointment.tokenNumber}',
//                         ),
//                         backgroundColor: Colors.green,
//                         duration: const Duration(seconds: 3),
//                       ),
//                     );
//                   } else if (viewModel.error.isNotEmpty && mounted) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('❌ ${viewModel.error}'),
//                         backgroundColor: Colors.red,
//                         duration: const Duration(seconds: 3),
//                       ),
//                     );
//                   }
//                   return;
//                 }

//                 // For Pay Later and Way Off, create appointment directly (no popup)
//                 if (viewModel.selectedPaymentMethodEnum ==
//                         PaymentMethod.payLater ||
//                     viewModel.selectedPaymentMethodEnum ==
//                         PaymentMethod.wayOff) {
//                   final result = await viewModel.createSimpleAppointment();
//                   if (result != null && mounted) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(
//                           '✅ Appointment created successfully! Token: #${result.appointment.tokenNumber}',
//                         ),
//                         backgroundColor: Colors.green,
//                         duration: const Duration(seconds: 3),
//                       ),
//                     );
//                   } else if (viewModel.error.isNotEmpty && mounted) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('❌ ${viewModel.error}'),
//                         backgroundColor: Colors.red,
//                         duration: const Duration(seconds: 3),
//                       ),
//                     );
//                   }
//                   return;
//                 }

//                 // For Pay Now, show payment confirmation popup immediately (NO validation)
//                 showDialog(
//                   context: context,
//                   builder: (context) =>
//                       PaymentConfirmationPopup(viewModel: viewModel),
//                 );
//               },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFF2C3E50),
//           foregroundColor: Colors.white,
//           padding: EdgeInsets.symmetric(
//             horizontal: 24 * scaleFactor,
//             vertical: 12 * scaleFactor,
//           ),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//           elevation: 3,
//           shadowColor: Colors.black.withOpacity(0.2),
//         ),
//         child: viewModel.isCreating
//             ? SizedBox(
//                 height: 18 * scaleFactor,
//                 width: 18 * scaleFactor,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2,
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                 ),
//               )
//             : Text(
//                 'Book Now',
//                 style: TextStyle(
//                   fontSize: 14 * scaleFactor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//       ),
//     );
//   }

//   Widget _buildDropdownField(
//     String label,
//     String value,
//     Function(String?)? onChanged,
//     double scaleFactor,
//     List<String> items, {
//     bool disabled = false, // ✅ Add disabled parameter
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 14 * scaleFactor,
//             fontWeight: FontWeight.w500,
//             color: disabled
//                 ? const Color(0xFF999999)
//                 : const Color(0xFF333333), // ✅ Gray when disabled
//           ),
//         ),
//         SizedBox(height: 6 * scaleFactor),
//         Container(
//           height: 40 * scaleFactor,
//           decoration: BoxDecoration(
//             color: disabled
//                 ? const Color(0xFFF5F5F5)
//                 : Colors.white, // ✅ Gray background when disabled
//             border: Border.all(
//               color: disabled
//                   ? const Color(0xFFCCCCCC)
//                   : const Color(0xFFE0E0E0),
//             ),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton<String>(
//               value: value,
//               onChanged: disabled ? null : onChanged, // ✅ Disable when disabled
//               padding: EdgeInsets.symmetric(horizontal: 12 * scaleFactor),
//               items: items
//                   .map(
//                     (item) => DropdownMenuItem(
//                       value: item,
//                       child: Text(
//                         _getConsultationTypeLabel(item),
//                         style: TextStyle(
//                           fontSize: 14 * scaleFactor,
//                           color: disabled
//                               ? const Color(0xFF999999)
//                               : const Color(
//                                   0xFF333333,
//                                 ), // ✅ Gray text when disabled
//                         ),
//                       ),
//                     ),
//                   )
//                   .toList(),
//               icon: Icon(
//                 Icons.keyboard_arrow_down,
//                 color: disabled
//                     ? const Color(0xFFCCCCCC)
//                     : const Color(0xFF666666),
//                 size: 20 * scaleFactor,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // Helper method to get user-friendly labels for consultation types
//   String _getConsultationTypeLabel(String value) {
//     switch (value) {
//       case 'clinic_visit':
//         return '🏥 Clinic Visit';
//       case 'video_consultation':
//         return '💻 Video Consultation';
//       case 'follow-up-via-clinic':
//         return '🔄 Follow-Up (Clinic)';
//       case 'follow-up-via-video':
//         return '🔄 Follow-Up (Video)';
//       default:
//         return value;
//     }
//   }

//   Widget _buildTextField(
//     String label,
//     String hint,
//     double scaleFactor,
//     String value,
//     Function(String) onChanged,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 14 * scaleFactor,
//             fontWeight: FontWeight.w500,
//             color: const Color(0xFF333333),
//           ),
//         ),
//         SizedBox(height: 6 * scaleFactor),
//         Container(
//           height: 40 * scaleFactor,
//           decoration: BoxDecoration(
//             border: Border.all(color: const Color(0xFFE0E0E0)),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: TextField(
//             onChanged: onChanged,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(
//                 color: const Color(0xFF999999),
//                 fontSize: 14 * scaleFactor,
//               ),
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.symmetric(
//                 horizontal: 12 * scaleFactor,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildMobileConsultationDetailsSection(
//     NewAppointmentViewModel viewModel,
//     double scaleFactor,
//   ) {
//     // ✅ Dropdowns are always enabled - user selects doctor/department first, then patient
//     // Validation happens when patient is selected

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildMobileDropdownField(
//           'consultation type',
//           viewModel.selectedConsultationType,
//           (value) => viewModel.setConsultationType(value!),
//           scaleFactor,
//           viewModel.consultationTypesList,
//         ),
//         SizedBox(height: 16 * scaleFactor),
//         _buildMobileDropdownField(
//           'Select Department',
//           viewModel.selectedDepartment,
//           (value) => viewModel.setDepartment(value!),
//           scaleFactor,
//           viewModel.departments
//               .map((dept) => dept.name ?? 'Orthology')
//               .toList(),
//         ),
//         SizedBox(height: 16 * scaleFactor),
//         _buildMobileDropdownField(
//           'Select Doctor',
//           viewModel.selectedDoctor,
//           (value) => viewModel.setDoctor(value!),
//           scaleFactor,
//           viewModel.clinicDoctors.isEmpty
//               ? ['Loading...']
//               : viewModel.clinicDoctors
//                     .map(
//                       (doctor) =>
//                           doctor.fullName ??
//                           '${doctor.firstName} ${doctor.lastName}',
//                     )
//                     .toList(),
//         ),
//         SizedBox(height: 16 * scaleFactor),
//         _buildMobileTextField(
//           'Reason or Add Notes',
//           'Add Patient Note',
//           scaleFactor,
//           viewModel.patientNotes,
//           (value) => viewModel.setPatientNotes(value),
//         ),
//       ],
//     );
//   }

//   Widget _buildMobileAvailableSlotsSection(
//     NewAppointmentViewModel viewModel,
//     double scaleFactor,
//   ) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 10,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       padding: EdgeInsets.all(14 * scaleFactor),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Select Date Heading with Date Picker Button
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Icon(
//                     Icons.calendar_month,
//                     size: 18 * scaleFactor,
//                     color: const Color(0xFF007BFF),
//                   ),
//                   SizedBox(width: 6 * scaleFactor),
//                   Text(
//                     'Select Date',
//                     style: TextStyle(
//                       fontSize: 13 * scaleFactor,
//                       fontWeight: FontWeight.w600,
//                       color: const Color(0xFF2C3E50),
//                       letterSpacing: 0.3,
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Color(0xFF007BFF), Color(0xFF0056B3)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(6),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Color(0xFF007BFF).withOpacity(0.25),
//                       blurRadius: 6,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: ElevatedButton.icon(
//                   onPressed: () => _showDatePickerDialog(context, viewModel),
//                   icon: Icon(Icons.calendar_today, size: 14 * scaleFactor),
//                   label: Text(
//                     'Pick Date',
//                     style: TextStyle(
//                       fontSize: 12 * scaleFactor,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.transparent,
//                     foregroundColor: Colors.white,
//                     shadowColor: Colors.transparent,
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 10 * scaleFactor,
//                       vertical: 6 * scaleFactor,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     elevation: 0,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 10 * scaleFactor),

//           // Horizontal Date Selector
//           _buildHorizontalDateSelector(viewModel, scaleFactor),

//           SizedBox(height: 14 * scaleFactor),

//           // Available Slots Heading with icon
//           Row(
//             children: [
//               Icon(
//                 Icons.schedule,
//                 size: 18 * scaleFactor,
//                 color: const Color(0xFF28A745),
//               ),
//               SizedBox(width: 6 * scaleFactor),
//               Text(
//                 'Available Slots',
//                 style: TextStyle(
//                   fontSize: 14 * scaleFactor,
//                   fontWeight: FontWeight.w600,
//                   color: const Color(0xFF2C3E50),
//                   letterSpacing: 0.3,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 10 * scaleFactor),

//           // Time Slots from API
//           if (viewModel.isLoadingSlots)
//             Center(
//               child: Padding(
//                 padding: EdgeInsets.all(12 * scaleFactor),
//                 child: CircularProgressIndicator(),
//               ),
//             )
//           else if (viewModel.groupedTimeSlots == null ||
//               (viewModel.groupedTimeSlots!.days.isEmpty) ||
//               (viewModel.groupedTimeSlots!.days.every((day) => !day.hasSlots)))
//             Center(
//               child: Padding(
//                 padding: EdgeInsets.all(12 * scaleFactor),
//                 child: Text(
//                   'No time slots available for this date.',
//                   style: TextStyle(
//                     fontSize: 13 * scaleFactor,
//                     color: const Color(0xFF666666),
//                   ),
//                 ),
//               ),
//             )
//           else
//             ..._buildDynamicMobileTimeSlotSections(viewModel, scaleFactor),
//         ],
//       ),
//     );
//   }

//   Widget _buildMobileSearchPatientSection(
//     NewAppointmentViewModel viewModel,
//     double scaleFactor,
//   ) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 10,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       padding: EdgeInsets.all(14 * scaleFactor),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(
//                 Icons.person_search,
//                 size: 18 * scaleFactor,
//                 color: const Color(0xFF6C757D),
//               ),
//               SizedBox(width: 6 * scaleFactor),
//               Text(
//                 'Search Patient',
//                 style: TextStyle(
//                   fontSize: 14 * scaleFactor,
//                   fontWeight: FontWeight.w600,
//                   color: const Color(0xFF2C3E50),
//                   letterSpacing: 0.3,
//                 ),
//               ),
//               Spacer(),
//               // ✅ NEW: Refresh button to update follow-up eligibility
//               if (viewModel.lastPatientSearchQuery.isNotEmpty)
//                 Tooltip(
//                   message: 'Refresh follow-up status',
//                   child: IconButton(
//                     icon: Icon(
//                       Icons.refresh,
//                       size: 18 * scaleFactor,
//                       color: const Color(0xFF007BFF),
//                     ),
//                     onPressed: () {
//                       viewModel.refreshPatientSearch();
//                     },
//                     padding: EdgeInsets.all(4 * scaleFactor),
//                     constraints: BoxConstraints(),
//                   ),
//                 ),
//             ],
//           ),
//           SizedBox(height: 8 * scaleFactor),
//           Row(
//             children: [
//               // Radio Buttons
//               Row(
//                 children: [
//                   Radio<bool>(
//                     value: true,
//                     groupValue: viewModel.isMobileSearch,
//                     onChanged: (value) => viewModel.setSearchType(value!),
//                     activeColor: const Color(0xFF007BFF),
//                   ),
//                   Text(
//                     'Mobile No',
//                     style: TextStyle(fontSize: 14 * scaleFactor),
//                   ),
//                   SizedBox(width: 16 * scaleFactor),
//                   Radio<bool>(
//                     value: false,
//                     groupValue: viewModel.isMobileSearch,
//                     onChanged: (value) => viewModel.setSearchType(value!),
//                     activeColor: const Color(0xFF007BFF),
//                   ),
//                   Text('Mo ID', style: TextStyle(fontSize: 13 * scaleFactor)),
//                 ],
//               ),
//               const Spacer(),
//             ],
//           ),
//           SizedBox(height: 12 * scaleFactor),
//           Row(
//             children: [
//               // Search Input
//               Expanded(
//                 child: Container(
//                   height: 40 * scaleFactor,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: const Color(0xFFE0E0E0)),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: TextField(
//                     controller: searchController,
//                     onChanged: (value) => viewModel.setSearchQuery(value),
//                     decoration: InputDecoration(
//                       hintText: '123-123-123',
//                       hintStyle: TextStyle(
//                         color: const Color(0xFF999999),
//                         fontSize: 13 * scaleFactor,
//                       ),
//                       suffixIcon: Icon(
//                         Icons.search,
//                         color: const Color(0xFF666666),
//                         size: 18 * scaleFactor,
//                       ),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(
//                         horizontal: 10 * scaleFactor,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 8 * scaleFactor),
//               // Add New Patient Button
//               OutlinedButton.icon(
//                 onPressed: () =>
//                     _showQuickPatientRegistrationDialog(context, viewModel),
//                 style: OutlinedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   foregroundColor: const Color(0xFF333333),
//                   side: const BorderSide(color: Color(0xFFE0E0E0)),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 12 * scaleFactor,
//                     vertical: 6 * scaleFactor,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                 ),
//                 icon: Icon(
//                   Icons.add,
//                   size: 14 * scaleFactor,
//                   color: const Color(0xFFE53935),
//                 ),
//                 label: Text(
//                   'Add New Patient',
//                   style: TextStyle(fontSize: 13 * scaleFactor),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMobilePaymentMethodSection(
//     NewAppointmentViewModel viewModel,
//     double scaleFactor,
//   ) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 10,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       padding: EdgeInsets.all(14 * scaleFactor),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(
//                 Icons.payment,
//                 size: 18 * scaleFactor,
//                 color: const Color(0xFF28A745),
//               ),
//               SizedBox(width: 6 * scaleFactor),
//               Text(
//                 'Payment Method',
//                 style: TextStyle(
//                   fontSize: 14 * scaleFactor,
//                   fontWeight: FontWeight.w600,
//                   color: const Color(0xFF2C3E50),
//                   letterSpacing: 0.3,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 12 * scaleFactor),
//           Wrap(
//             spacing: 8 * scaleFactor,
//             runSpacing: 8 * scaleFactor,
//             children: PaymentMethodOptions.allMethods.map((method) {
//               final isSelected = viewModel.selectedPaymentMethodEnum == method;
//               return GestureDetector(
//                 onTap: () {
//                   viewModel.setPaymentMethodEnum(method);
//                 },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 12 * scaleFactor,
//                     vertical: 8 * scaleFactor,
//                   ),
//                   decoration: BoxDecoration(
//                     color: isSelected
//                         ? Colors.blue.shade50
//                         : Colors.grey.shade50,
//                     border: Border.all(
//                       color: isSelected ? Colors.blue : Colors.grey.shade300,
//                       width: isSelected ? 2 : 1,
//                     ),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         method.methodIcon,
//                         style: TextStyle(fontSize: 16 * scaleFactor),
//                       ),
//                       SizedBox(width: 4 * scaleFactor),
//                       Text(
//                         method.displayName,
//                         style: TextStyle(
//                           fontSize: 14 * scaleFactor,
//                           fontWeight: isSelected
//                               ? FontWeight.w600
//                               : FontWeight.normal,
//                           color: isSelected
//                               ? Colors.blue.shade700
//                               : Colors.grey.shade700,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMobileBookNowButton(
//     NewAppointmentViewModel viewModel,
//     double scaleFactor,
//   ) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: ElevatedButton(
//         onPressed: viewModel.isCreating
//             ? null
//             : () async {
//                 // Validate required selections
//                 if (viewModel.selectedClinicPatient == null) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('❌ Please select a patient'),
//                       backgroundColor: Colors.red,
//                       duration: Duration(seconds: 3),
//                     ),
//                   );
//                   return;
//                 }

//                 if (viewModel.selectedDoctor.isEmpty) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('❌ Please select a doctor'),
//                       backgroundColor: Colors.red,
//                       duration: Duration(seconds: 3),
//                     ),
//                   );
//                   return;
//                 }

//                 if (viewModel.selectedSlotDetails == null) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('❌ Please select a time slot'),
//                       backgroundColor: Colors.red,
//                       duration: Duration(seconds: 3),
//                     ),
//                   );
//                   return;
//                 }

//                 // ✅ Check if FREE follow-up (no payment needed)
//                 final isFreeFollowUp =
//                     viewModel.selectedConsultationType.startsWith(
//                       'follow-up',
//                     ) &&
//                     (viewModel
//                             .selectedClinicPatient
//                             ?.followUpEligibility
//                             ?.isFree ??
//                         false);

//                 // ✅ For FREE follow-up, create directly (no payment required)
//                 if (isFreeFollowUp) {
//                   final result = await viewModel.createSimpleAppointment();
//                   if (result != null && mounted) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(
//                           '✅ Follow-up appointment created successfully! Token: #${result.appointment.tokenNumber}',
//                         ),
//                         backgroundColor: Colors.green,
//                         duration: const Duration(seconds: 3),
//                       ),
//                     );
//                   } else if (viewModel.error.isNotEmpty && mounted) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('❌ ${viewModel.error}'),
//                         backgroundColor: Colors.red,
//                         duration: const Duration(seconds: 3),
//                       ),
//                     );
//                   }
//                   return;
//                 }

//                 // For Pay Later and Way Off, create appointment directly (no popup)
//                 if (viewModel.selectedPaymentMethodEnum ==
//                         PaymentMethod.payLater ||
//                     viewModel.selectedPaymentMethodEnum ==
//                         PaymentMethod.wayOff) {
//                   final result = await viewModel.createSimpleAppointment();
//                   if (result != null && mounted) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(
//                           '✅ Appointment created successfully! Token: #${result.appointment.tokenNumber}',
//                         ),
//                         backgroundColor: Colors.green,
//                         duration: const Duration(seconds: 3),
//                       ),
//                     );
//                   } else if (viewModel.error.isNotEmpty && mounted) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('❌ ${viewModel.error}'),
//                         backgroundColor: Colors.red,
//                         duration: const Duration(seconds: 3),
//                       ),
//                     );
//                   }
//                   return;
//                 }

//                 // For Pay Now, show payment confirmation popup immediately (NO validation)
//                 showDialog(
//                   context: context,
//                   builder: (context) =>
//                       PaymentConfirmationPopup(viewModel: viewModel),
//                 );
//               },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFF2C3E50),
//           foregroundColor: Colors.white,
//           padding: EdgeInsets.symmetric(
//             horizontal: 24 * scaleFactor,
//             vertical: 12 * scaleFactor,
//           ),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//           elevation: 3,
//           shadowColor: Colors.black.withOpacity(0.2),
//         ),
//         child: viewModel.isCreating
//             ? SizedBox(
//                 height: 18 * scaleFactor,
//                 width: 18 * scaleFactor,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2,
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                 ),
//               )
//             : Text(
//                 'Book Now',
//                 style: TextStyle(
//                   fontSize: 14 * scaleFactor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//       ),
//     );
//   }

//   Widget _buildMobileDropdownField(
//     String label,
//     String value,
//     Function(String?)? onChanged,
//     double scaleFactor,
//     List<String> items, {
//     bool disabled = false, // ✅ Add disabled parameter
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 14 * scaleFactor,
//             fontWeight: FontWeight.w500,
//             color: disabled
//                 ? const Color(0xFF999999)
//                 : const Color(0xFF666666), // ✅ Gray when disabled
//           ),
//         ),
//         SizedBox(height: 8 * scaleFactor),
//         Container(
//           height: 40 * scaleFactor,
//           decoration: BoxDecoration(
//             color: disabled
//                 ? const Color(0xFFF5F5F5)
//                 : Colors.white, // ✅ Gray background when disabled
//             border: Border.all(
//               color: disabled
//                   ? const Color(0xFFCCCCCC)
//                   : const Color(0xFFE0E0E0),
//             ),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton<String>(
//               value: value,
//               onChanged: disabled ? null : onChanged, // ✅ Disable when disabled
//               padding: EdgeInsets.symmetric(horizontal: 12 * scaleFactor),
//               items: items
//                   .map(
//                     (item) => DropdownMenuItem(
//                       value: item,
//                       child: Text(
//                         _getConsultationTypeLabel(item),
//                         style: TextStyle(
//                           fontSize: 14 * scaleFactor,
//                           color: disabled
//                               ? const Color(0xFF999999)
//                               : const Color(
//                                   0xFF333333,
//                                 ), // ✅ Gray text when disabled
//                         ),
//                       ),
//                     ),
//                   )
//                   .toList(),
//               icon: Icon(
//                 Icons.keyboard_arrow_down,
//                 color: disabled
//                     ? const Color(0xFFCCCCCC)
//                     : const Color(0xFF666666),
//                 size: 20 * scaleFactor,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildMobileTextField(
//     String label,
//     String hint,
//     double scaleFactor,
//     String value,
//     Function(String) onChanged,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 14 * scaleFactor,
//             fontWeight: FontWeight.w500,
//             color: const Color(0xFF666666),
//           ),
//         ),
//         SizedBox(height: 8 * scaleFactor),
//         Container(
//           height: 40 * scaleFactor,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             border: Border.all(color: const Color(0xFFE0E0E0)),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: TextField(
//             onChanged: onChanged,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(
//                 color: const Color(0xFF999999),
//                 fontSize: 14 * scaleFactor,
//               ),
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.symmetric(
//                 horizontal: 12 * scaleFactor,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildFooter() {
//     return const Center(
//       child: Text(
//         'Copyright © 2025 DrMe. All rights reserved',
//         style: TextStyle(color: Color(0xFF999999), fontSize: 12),
//       ),
//     );
//   }

//   // Build dynamic time slot sections from API data (Web layout)
//   List<Widget> _buildDynamicTimeSlotSections(
//     NewAppointmentViewModel viewModel,
//     double scaleFactor,
//   ) {
//     // Use grouped time slots if available
//     if (viewModel.groupedTimeSlots != null) {
//       final sections = <Widget>[];

//       // Get morning and afternoon slots
//       final morningSlots = viewModel.morningSlots;
//       final afternoonSlots = viewModel.afternoonSlots;

//       // Morning section
//       if (morningSlots.isNotEmpty) {
//         sections.add(
//           _buildTimeSlotSection(
//             'Morning Slots (${morningSlots.where((s) => s.availableSpots > 0).length} available)',
//             morningSlots,
//             scaleFactor,
//             viewModel,
//             isMorning: true,
//           ),
//         );
//         sections.add(SizedBox(height: 12 * scaleFactor));
//       }

//       // Afternoon section
//       if (afternoonSlots.isNotEmpty) {
//         sections.add(
//           _buildTimeSlotSection(
//             'Afternoon Slots (${afternoonSlots.where((s) => s.availableSpots > 0).length} available)',
//             afternoonSlots,
//             scaleFactor,
//             viewModel,
//             isMorning: false,
//           ),
//         );
//         sections.add(SizedBox(height: 4 * scaleFactor));
//       }

//       return sections;
//     }

//     // Fallback to old logic if grouped slots not available
//     final slotsByDay = <String, List<String>>{};

//     // Group slots by day
//     for (var slot in viewModel.doctorTimeSlots) {
//       final dayName = slot.dayName;
//       final timeRange =
//           '${_formatTime(slot.startTime)} - ${_formatTime(slot.endTime)}';

//       if (!slotsByDay.containsKey(dayName)) {
//         slotsByDay[dayName] = [];
//       }
//       slotsByDay[dayName]!.add(timeRange);
//     }

//     // Build UI sections for each day
//     final sections = <Widget>[];
//     slotsByDay.forEach((dayName, timeSlots) {
//       sections.add(
//         _buildTimeSlotSection(
//           '$dayName Slots',
//           timeSlots,
//           scaleFactor,
//           viewModel,
//         ),
//       );
//       sections.add(SizedBox(height: 4 * scaleFactor));
//     });

//     return sections;
//   }

//   // Build time slot section (Web layout)
//   Widget _buildTimeSlotSection(
//     String title,
//     dynamic slots,
//     double scaleFactor,
//     NewAppointmentViewModel viewModel, {
//     bool isMorning = true,
//   }) {
//     // Handle both List<String> and List<DoctorTimeSlotResponse>
//     final List<Widget> slotWidgets = [];

//     if (slots is List<DoctorTimeSlotResponse>) {
//       // New grouped slots with full details
//       for (var slotObj in slots) {
//         final startTime = _formatTime(slotObj.startTime);
//         final endTime = _formatTime(slotObj.endTime);
//         final slotTime = '$startTime - $endTime'; // For selection
//         final isSelected = viewModel.selectedSlotId == slotObj.id;
//         final isBooked =
//             slotObj.bookedPatients >= slotObj.maxPatients ||
//             !slotObj.isAvailable;
//         final isClickable = !isBooked;

//         // ✅ Match reschedule modal colors exactly
//         Color backgroundColor;
//         Color textColor;

//         if (isSelected) {
//           // ⚫ BLACK - Selected slot (matching reschedule)
//           backgroundColor = Colors.black;
//           textColor = Colors.white;
//         } else if (isBooked) {
//           // 🔴 RED - Booked slots (matching reschedule)
//           backgroundColor = const Color(0xFFFFEBEE);
//           textColor = const Color(0xFFD32F2F);
//         } else {
//           // 🟢 GREEN - Available slots (matching reschedule)
//           backgroundColor = const Color(0xFFE8F5E8);
//           textColor = const Color(0xFF2E7D32);
//         }

//         slotWidgets.add(
//           Container(
//             margin: EdgeInsets.only(right: 6 * scaleFactor),
//             child: InkWell(
//               onTap: isClickable
//                   ? () {
//                       viewModel.setTimeSlot(slotTime, slotDetails: slotObj);
//                     }
//                   : null,
//               child: Opacity(
//                 opacity: isBooked ? 0.6 : 1.0,
//                 child: Container(
//                   width: 90,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 10,
//                     vertical: 8,
//                   ),
//                   decoration: BoxDecoration(
//                     color: backgroundColor,
//                     borderRadius: BorderRadius.circular(8),
//                     border: isSelected
//                         ? null
//                         : Border.all(color: const Color(0xFFE0E0E0)),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // ✅ Only Start Time (matching reschedule modal)
//                       Text(
//                         startTime,
//                         style: TextStyle(
//                           color: isSelected ? Colors.white : textColor,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       // ✅ Status Text (matching reschedule modal)
//                       Text(
//                         isBooked
//                             ? 'Booked'
//                             : (isSelected ? 'Selected' : 'Available'),
//                         style: TextStyle(
//                           color: isSelected
//                               ? Colors.white70
//                               : (isBooked
//                                     ? textColor
//                                     : textColor.withOpacity(0.7)),
//                           fontSize: 10,
//                         ),
//                         textAlign: TextAlign.center,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       }
//     } else if (slots is List<String>) {
//       // Fallback for old string-based slots
//       for (var slot in slots) {
//         final isSelected = slot == viewModel.selectedTimeSlot;

//         slotWidgets.add(
//           Container(
//             margin: EdgeInsets.only(right: 6 * scaleFactor),
//             child: InkWell(
//               onTap: () {
//                 viewModel.setTimeSlot(slot);
//               },
//               child: Container(
//                 width: 85 * scaleFactor,
//                 constraints: BoxConstraints(minHeight: 50 * scaleFactor),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 8 * scaleFactor,
//                   vertical: 6 * scaleFactor,
//                 ),
//                 decoration: BoxDecoration(
//                   gradient: isSelected
//                       ? LinearGradient(
//                           colors: [Color(0xFF2C3E50), Color(0xFF1A252F)],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         )
//                       : LinearGradient(
//                           colors: [Color(0xFFE6F7ED), Color(0xFFD4F1E3)],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(
//                     color: isSelected
//                         ? const Color(0xFF1A252F)
//                         : const Color(0xFFB8E6CA),
//                     width: 1.5,
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       slot,
//                       style: TextStyle(
//                         color: isSelected
//                             ? Colors.white
//                             : const Color(0xFF2C7A4D),
//                         fontSize: 11 * scaleFactor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       }
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Icon(
//               isMorning ? Icons.wb_sunny : Icons.brightness_3,
//               size: 16 * scaleFactor,
//               color: isMorning
//                   ? Colors.orange.shade600
//                   : Colors.indigo.shade600,
//             ),
//             SizedBox(width: 6 * scaleFactor),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 13 * scaleFactor,
//                 fontWeight: FontWeight.w600,
//                 color: const Color(0xFF333333),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 8 * scaleFactor),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(children: slotWidgets),
//         ),
//       ],
//     );
//   }

//   // Build dynamic time slot sections from API data (Mobile layout)
//   List<Widget> _buildDynamicMobileTimeSlotSections(
//     NewAppointmentViewModel viewModel,
//     double scaleFactor,
//   ) {
//     // Use grouped time slots if available
//     if (viewModel.groupedTimeSlots != null) {
//       final sections = <Widget>[];

//       // Get morning and afternoon slots
//       final morningSlots = viewModel.morningSlots;
//       final afternoonSlots = viewModel.afternoonSlots;

//       // Morning section
//       if (morningSlots.isNotEmpty) {
//         sections.add(
//           _buildMobileTimeSlotSection(
//             'Morning Slots (${morningSlots.where((s) => s.availableSpots > 0).length} available)',
//             morningSlots,
//             scaleFactor,
//             viewModel,
//             isMorning: true,
//           ),
//         );
//         sections.add(SizedBox(height: 12 * scaleFactor));
//       }

//       // Afternoon section
//       if (afternoonSlots.isNotEmpty) {
//         sections.add(
//           _buildMobileTimeSlotSection(
//             'Afternoon Slots (${afternoonSlots.where((s) => s.availableSpots > 0).length} available)',
//             afternoonSlots,
//             scaleFactor,
//             viewModel,
//             isMorning: false,
//           ),
//         );
//         sections.add(SizedBox(height: 8 * scaleFactor));
//       }

//       return sections;
//     }

//     // Fallback to old logic if grouped slots not available
//     final slotsByDay = <String, List<String>>{};

//     // Group slots by day
//     for (var slot in viewModel.doctorTimeSlots) {
//       final dayName = slot.dayName;
//       final timeRange =
//           '${_formatTime(slot.startTime)} - ${_formatTime(slot.endTime)}';

//       if (!slotsByDay.containsKey(dayName)) {
//         slotsByDay[dayName] = [];
//       }
//       slotsByDay[dayName]!.add(timeRange);
//     }

//     // Build UI sections for each day
//     final sections = <Widget>[];
//     slotsByDay.forEach((dayName, timeSlots) {
//       sections.add(
//         _buildMobileTimeSlotSection(
//           '$dayName Slots',
//           timeSlots,
//           scaleFactor,
//           viewModel,
//         ),
//       );
//       sections.add(SizedBox(height: 8 * scaleFactor));
//     });

//     return sections;
//   }

//   // Build time slot section (Mobile layout)
//   Widget _buildMobileTimeSlotSection(
//     String title,
//     dynamic slots,
//     double scaleFactor,
//     NewAppointmentViewModel viewModel, {
//     bool isMorning = true,
//   }) {
//     final List<Widget> slotWidgets = [];

//     if (slots is List<DoctorTimeSlotResponse>) {
//       // New grouped slots with full details
//       for (var slotObj in slots) {
//         final startTime = _formatTime(slotObj.startTime);
//         final endTime = _formatTime(slotObj.endTime);
//         final slotTime = '$startTime - $endTime'; // For selection
//         final isSelected = viewModel.selectedSlotId == slotObj.id;
//         final isBooked =
//             slotObj.bookedPatients >= slotObj.maxPatients ||
//             !slotObj.isAvailable;
//         final isClickable = !isBooked;

//         Color backgroundColor;
//         Color borderColor;
//         Color textColor;

//         if (isBooked) {
//           // 🔴 RED - Booked slots (not clickable)
//           backgroundColor = const Color(0xFFFFEBEE);
//           borderColor = const Color(0xFFF44336);
//           textColor = const Color(0xFFB71C1C);
//         } else if (isSelected) {
//           // 🔵 BLUE - Selected slot
//           backgroundColor = const Color(0xFFE3F2FD);
//           borderColor = const Color(0xFF2196F3);
//           textColor = const Color(0xFF0D47A1);
//         } else {
//           // 🟢 GREEN - Available slots
//           backgroundColor = const Color(0xFFE8F5E9);
//           borderColor = const Color(0xFF4CAF50);
//           textColor = const Color(0xFF1B5E20);
//         }

//         slotWidgets.add(
//           Container(
//             margin: EdgeInsets.only(right: 6 * scaleFactor),
//             child: InkWell(
//               onTap: isClickable
//                   ? () {
//                       viewModel.setTimeSlot(slotTime, slotDetails: slotObj);
//                     }
//                   : null,
//               child: Opacity(
//                 opacity: isBooked ? 0.6 : 1.0,
//                 child: Container(
//                   width: 90 * scaleFactor,
//                   constraints: BoxConstraints(minHeight: 70 * scaleFactor),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 8 * scaleFactor,
//                     vertical: 8 * scaleFactor,
//                   ),
//                   decoration: BoxDecoration(
//                     color: backgroundColor,
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(
//                       color: borderColor,
//                       width: isBooked ? 2 : 1.5,
//                     ),
//                     boxShadow: isBooked
//                         ? null
//                         : isSelected
//                         ? [
//                             BoxShadow(
//                               color: borderColor.withOpacity(0.3),
//                               blurRadius: 4,
//                               offset: const Offset(0, 2),
//                             ),
//                           ]
//                         : null,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       // Start Time
//                       Text(
//                         startTime,
//                         style: TextStyle(
//                           color: textColor,
//                           fontSize: 13 * scaleFactor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 2 * scaleFactor),
//                       // "to" text
//                       Text(
//                         'to',
//                         style: TextStyle(
//                           color: isSelected
//                               ? Colors.white.withOpacity(0.7)
//                               : const Color(0xFF666666),
//                           fontSize: 8 * scaleFactor,
//                           fontWeight: FontWeight.normal,
//                         ),
//                       ),
//                       SizedBox(height: 2 * scaleFactor),
//                       // End Time
//                       Text(
//                         endTime,
//                         style: TextStyle(
//                           color: textColor,
//                           fontSize: 13 * scaleFactor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 4 * scaleFactor),
//                       // Capacity
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             isBooked ? Icons.block : Icons.people,
//                             size: 11 * scaleFactor,
//                             color: isSelected && !isBooked
//                                 ? Colors.white.withOpacity(0.9)
//                                 : textColor,
//                           ),
//                           SizedBox(width: 3 * scaleFactor),
//                           Text(
//                             isBooked
//                                 ? '${slotObj.bookedPatients}/${slotObj.maxPatients}'
//                                 : '${slotObj.availableSpots}/${slotObj.maxPatients}',
//                             style: TextStyle(
//                               color: isSelected && !isBooked
//                                   ? Colors.white.withOpacity(0.9)
//                                   : textColor,
//                               fontSize: 10 * scaleFactor,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 3 * scaleFactor),
//                       // Status Badge
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 6 * scaleFactor,
//                           vertical: 2 * scaleFactor,
//                         ),
//                         decoration: BoxDecoration(
//                           color: borderColor.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             if (isBooked)
//                               Icon(
//                                 Icons.block,
//                                 size: 10 * scaleFactor,
//                                 color: textColor,
//                               ),
//                             if (isBooked) SizedBox(width: 3 * scaleFactor),
//                             Text(
//                               isBooked ? 'Booked' : 'Available',
//                               style: TextStyle(
//                                 color: textColor,
//                                 fontSize: 9 * scaleFactor,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       }
//     } else if (slots is List<String>) {
//       // Fallback for old string-based slots
//       for (var slot in slots) {
//         final isSelected = slot == viewModel.selectedTimeSlot;

//         Color backgroundColor;
//         Color textColor;

//         if (isSelected) {
//           backgroundColor = Colors.black;
//           textColor = Colors.white;
//         } else {
//           backgroundColor = const Color(0xFFE6F7ED);
//           textColor = const Color(0xFF388E3C);
//         }

//         slotWidgets.add(
//           Container(
//             margin: EdgeInsets.only(right: 6 * scaleFactor),
//             child: InkWell(
//               onTap: () {
//                 viewModel.setTimeSlot(slot);
//               },
//               child: Container(
//                 width: 85 * scaleFactor,
//                 constraints: BoxConstraints(minHeight: 50 * scaleFactor),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 6 * scaleFactor,
//                   vertical: 6 * scaleFactor,
//                 ),
//                 decoration: BoxDecoration(
//                   color: backgroundColor,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       slot,
//                       style: TextStyle(
//                         color: textColor,
//                         fontSize: 12 * scaleFactor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       }
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Icon(
//               isMorning ? Icons.wb_sunny : Icons.brightness_3,
//               size: 15 * scaleFactor,
//               color: isMorning
//                   ? Colors.orange.shade600
//                   : Colors.indigo.shade600,
//             ),
//             SizedBox(width: 6 * scaleFactor),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 13 * scaleFactor,
//                 fontWeight: FontWeight.w600,
//                 color: const Color(0xFF444444),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 8 * scaleFactor),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(children: slotWidgets),
//         ),
//       ],
//     );
//   }

//   // Show date picker dialog
//   Future<void> _showDatePickerDialog(
//     BuildContext context,
//     NewAppointmentViewModel viewModel,
//   ) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: viewModel.selectedSlotDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(Duration(days: 365)),
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: ColorScheme.light(
//               primary: const Color(0xFF007BFF), // Header background color
//               onPrimary: Colors.white, // Header text color
//               onSurface: const Color(0xFF333333), // Body text color
//             ),
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(
//                 foregroundColor: const Color(0xFF007BFF), // Button text color
//               ),
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );

//     if (picked != null) {
//       // Navigate to the selected month and date
//       viewModel.navigateToMonth(picked);
//       viewModel.selectSlotDate(picked);
//     }
//   }

//   // Build horizontal date selector
//   Widget _buildHorizontalDateSelector(
//     NewAppointmentViewModel viewModel,
//     double scaleFactor,
//   ) {
//     if (viewModel.availableDates.isEmpty) {
//       return SizedBox.shrink();
//     }

//     return Container(
//       height: 65 * scaleFactor,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: viewModel.availableDates.length,
//         itemBuilder: (context, index) {
//           final date = viewModel.availableDates[index];
//           final isSelected =
//               date.day == viewModel.selectedSlotDate.day &&
//               date.month == viewModel.selectedSlotDate.month &&
//               date.year == viewModel.selectedSlotDate.year;

//           final isToday =
//               date.day == DateTime.now().day &&
//               date.month == DateTime.now().month &&
//               date.year == DateTime.now().year;

//           return GestureDetector(
//             onTap: () => viewModel.selectSlotDate(date),
//             child: Container(
//               width: 55 * scaleFactor,
//               margin: EdgeInsets.only(right: 8 * scaleFactor),
//               decoration: BoxDecoration(
//                 gradient: isSelected
//                     ? LinearGradient(
//                         colors: [Color(0xFF007BFF), Color(0xFF0056B3)],
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                       )
//                     : null,
//                 color: isSelected ? null : Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                   color: isSelected
//                       ? const Color(0xFF0056B3)
//                       : const Color(0xFFD1D5DB),
//                   width: isSelected ? 1.5 : 1,
//                 ),
//                 boxShadow: [
//                   if (isSelected)
//                     BoxShadow(
//                       color: const Color(0xFF007BFF).withOpacity(0.35),
//                       blurRadius: 8,
//                       offset: const Offset(0, 3),
//                     )
//                   else
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.06),
//                       blurRadius: 4,
//                       offset: const Offset(0, 2),
//                     ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     _getDayName(date.weekday),
//                     style: TextStyle(
//                       fontSize: 10 * scaleFactor,
//                       color: isSelected
//                           ? Colors.white
//                           : const Color(0xFF666666),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   SizedBox(height: 3 * scaleFactor),
//                   Text(
//                     date.day.toString(),
//                     style: TextStyle(
//                       fontSize: 16 * scaleFactor,
//                       fontWeight: FontWeight.bold,
//                       color: isSelected
//                           ? Colors.white
//                           : const Color(0xFF333333),
//                     ),
//                   ),
//                   SizedBox(height: 2 * scaleFactor),
//                   Text(
//                     _getMonthName(date.month),
//                     style: TextStyle(
//                       fontSize: 9 * scaleFactor,
//                       color: isSelected
//                           ? Colors.white.withOpacity(0.9)
//                           : const Color(0xFF999999),
//                     ),
//                   ),
//                   if (isToday)
//                     Container(
//                       margin: EdgeInsets.only(top: 1 * scaleFactor),
//                       width: 3 * scaleFactor,
//                       height: 3 * scaleFactor,
//                       decoration: BoxDecoration(
//                         color: isSelected
//                             ? Colors.white
//                             : const Color(0xFF007BFF),
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // Helper method to get day name
//   String _getDayName(int weekday) {
//     switch (weekday) {
//       case 1:
//         return 'Mon';
//       case 2:
//         return 'Tue';
//       case 3:
//         return 'Wed';
//       case 4:
//         return 'Thu';
//       case 5:
//         return 'Fri';
//       case 6:
//         return 'Sat';
//       case 7:
//         return 'Sun';
//       default:
//         return '';
//     }
//   }

//   // Helper method to get month name
//   String _getMonthName(int month) {
//     const months = [
//       'Jan',
//       'Feb',
//       'Mar',
//       'Apr',
//       'May',
//       'Jun',
//       'Jul',
//       'Aug',
//       'Sep',
//       'Oct',
//       'Nov',
//       'Dec',
//     ];
//     return months[month - 1];
//   }

//   // Helper method to format time (convert 24h to 12h format)
//   String _formatTime(String time24) {
//     try {
//       // Handle ISO timestamp format (0000-01-01T14:45:00Z)
//       if (time24.contains('T')) {
//         final dateTime = DateTime.parse(time24);
//         final hour = dateTime.hour;
//         final minute = dateTime.minute;

//         final period = hour >= 12 ? 'PM' : 'AM';
//         final hour12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

//         return '$hour12:${minute.toString().padLeft(2, '0')} $period';
//       }

//       // Handle HH:MM format
//       final parts = time24.split(':');
//       int hour = int.parse(parts[0]);
//       final minute = parts[1]
//           .split('.')[0]
//           .split('Z')[0]
//           .trim(); // Handle any trailing chars

//       final period = hour >= 12 ? 'PM' : 'AM';
//       hour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

//       return '$hour:$minute $period';
//     } catch (e) {
//       print('⚠️ Failed to format time: $time24 - Error: $e');
//       return time24; // Return original if parsing fails
//     }
//   }

//   // Helper to build info row in dialog

//   // Show Quick Patient Registration Dialog
//   void _showQuickPatientRegistrationDialog(
//     BuildContext context,
//     NewAppointmentViewModel viewModel,
//   ) {
//     final firstNameController = TextEditingController();
//     final lastNameController = TextEditingController();
//     final phoneController = TextEditingController();
//     final formKey = GlobalKey<FormState>();

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Row(
//           children: [
//             Icon(Icons.person_add, color: Colors.blue),
//             SizedBox(width: 8),
//             Text(
//               'Quick Patient Registration',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//           ],
//         ),
//         content: SingleChildScrollView(
//           child: Form(
//             key: formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Only name and phone required',
//                   style: TextStyle(
//                     fontSize: 13,
//                     color: Colors.grey[600],
//                     fontStyle: FontStyle.italic,
//                   ),
//                 ),
//                 SizedBox(height: 16),

//                 // First Name
//                 TextFormField(
//                   controller: firstNameController,
//                   decoration: InputDecoration(
//                     labelText: 'First Name *',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.person),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return 'First name is required';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 12),

//                 // Last Name
//                 TextFormField(
//                   controller: lastNameController,
//                   decoration: InputDecoration(
//                     labelText: 'Last Name *',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.person_outline),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return 'Last name is required';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 12),

//                 // Phone
//                 TextFormField(
//                   controller: phoneController,
//                   decoration: InputDecoration(
//                     labelText: 'Phone Number *',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.phone),
//                     hintText: '+971501234567',
//                   ),
//                   keyboardType: TextInputType.phone,
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return 'Phone number is required';
//                     }
//                     return null;
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               firstNameController.dispose();
//               lastNameController.dispose();
//               phoneController.dispose();
//               Navigator.pop(context);
//             },
//             child: Text('Cancel'),
//           ),
//           ElevatedButton.icon(
//             onPressed: () async {
//               if (formKey.currentState!.validate()) {
//                 // Show loading
//                 showDialog(
//                   context: context,
//                   barrierDismissible: false,
//                   builder: (context) => Center(
//                     child: Card(
//                       child: Padding(
//                         padding: EdgeInsets.all(20),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             CircularProgressIndicator(),
//                             SizedBox(height: 16),
//                             Text('Registering patient...'),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );

//                 // Create patient
//                 final newPatient = await viewModel.createClinicPatient(
//                   firstName: firstNameController.text.trim(),
//                   lastName: lastNameController.text.trim(),
//                   phone: phoneController.text.trim(),
//                 );

//                 // Close loading dialog
//                 Navigator.pop(context);

//                 if (newPatient != null) {
//                   // Success - close registration dialog
//                   firstNameController.dispose();
//                   lastNameController.dispose();
//                   phoneController.dispose();
//                   Navigator.pop(context);

//                   // Show success message
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(
//                         '✅ Patient ${newPatient.firstName} ${newPatient.lastName} registered successfully!',
//                       ),
//                       backgroundColor: Colors.green,
//                       duration: Duration(seconds: 3),
//                     ),
//                   );
//                 } else {
//                   // Show error
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(
//                         '❌ Failed to register patient. ${viewModel.error}',
//                       ),
//                       backgroundColor: Colors.red,
//                       duration: Duration(seconds: 4),
//                     ),
//                   );
//                 }
//               }
//             },
//             icon: Icon(Icons.check),
//             label: Text('Register Patient'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue,
//               foregroundColor: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _viewModel.dispose();
//     searchController.dispose();
//     super.dispose();
//   }
// }
