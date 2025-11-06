// import 'package:a/modules/clinic/viewmodels/appointments/appointment_dashboard_viewmodel.dart';
// import 'package:a/modules/clinic/views/appointments/appointment_details_view.dart';
// import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'dart:math';

// class AppointmentsDashboard extends StatefulWidget {
//   final Function(String)? onNavigate;

//   const AppointmentsDashboard({super.key, this.onNavigate});

//   @override
//   State<AppointmentsDashboard> createState() => _AppointmentsDashboardState();
// }

// class _AppointmentsDashboardState extends State<AppointmentsDashboard> {
//   late AppointmentDashboardViewModel _viewModel;

//   @override
//   void initState() {
//     super.initState();
//     _viewModel = AppointmentDashboardViewModel(
//       Provider.of<AuthViewModel>(context, listen: false),
//     );
//     _viewModel.initializeSimpleDashboard(); // ✅ Use simple API
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider.value(
//       value: _viewModel,
//       child: Consumer<AppointmentDashboardViewModel>(
//         builder: (context, viewModel, child) {
//           return LayoutBuilder(
//             builder: (context, constraints) {
//               // For small mobile screens only (width < 600px), use the card design
//               if (constraints.maxWidth < 600) {
//                 return _buildMobileLayout(viewModel);
//               }
//               // For tablets and desktop screens (width >= 600px), use the table layout
//               else {
//                 return _buildWebLayout(viewModel);
//               }
//             },
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildMobileLayout(AppointmentDashboardViewModel viewModel) {
//     return Container(
//       width: double.infinity,
//       color: const Color(0xFFF8F9FA),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Summary Cards Grid
//             _buildMobileSummaryCards(viewModel),
//             const SizedBox(height: 20),

//             // Navigation Tabs and Action Buttons
//             _buildMobileTabsAndActions(viewModel),
//             const SizedBox(height: 16),

//             // Search and Filter Row
//             _buildMobileSearchAndFilter(),
//             const SizedBox(height: 16),

//             // Appointment Cards List
//             _buildMobileAppointmentCards(viewModel),
//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildWebLayout(AppointmentDashboardViewModel viewModel) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         // Determine if this is a tablet or desktop
//         final isTablet = constraints.maxWidth < 1024;

//         // Always show the UI structure, never hide it
//         return Container(
//           width: double.infinity,
//           color: const Color(0xFFF8F9FA),
//           child: SingleChildScrollView(
//             padding: EdgeInsets.all(isTablet ? 6 : 8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Greeting Section
//                 _buildGreetingSection(viewModel),
//                 SizedBox(height: isTablet ? 4 : 4),
//                 // Summary Cards
//                 _buildSummaryCards(viewModel),
//                 SizedBox(height: isTablet ? 8 : 10),

//                 // Table Controls
//                 _buildTableControls(viewModel),
//                 SizedBox(height: isTablet ? 6 : 8),

//                 // Appointments Table
//                 _buildAppointmentsTable(viewModel),
//                 SizedBox(height: isTablet ? 6 : 8),

//                 // Pagination
//                 _buildPagination(viewModel),
//                 SizedBox(height: isTablet ? 8 : 10),

//                 // Footer
//                 _buildFooter(),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildGreetingSection(AppointmentDashboardViewModel viewModel) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isTablet = constraints.maxWidth < 1024;
//         final isMobile = constraints.maxWidth < 480;

//         // Get current or selected date
//         final selectedDate = viewModel.selectedDate;
//         final displayDate = selectedDate != null
//             ? _formatDate(DateTime.parse(selectedDate))
//             : _formatDate(DateTime.now());

//         return Container(
//           width: double.infinity,
//           padding: EdgeInsets.symmetric(
//             horizontal: isMobile ? 8 : (isTablet ? 10 : 12),
//             vertical: isMobile ? 6 : (isTablet ? 6 : 8),
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           width: 5,
//                           height: 5,
//                           decoration: BoxDecoration(
//                             gradient: const LinearGradient(
//                               colors: [Color(0xFF10B981), Color(0xFF059669)],
//                             ),
//                             shape: BoxShape.circle,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: const Color(0xFF10B981).withOpacity(0.4),
//                                 blurRadius: 4,
//                                 spreadRadius: 0.5,
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 6),
//                         Flexible(
//                           child: RichText(
//                             overflow: TextOverflow.ellipsis,
//                             text: TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: 'Hi Arun Krishna, ',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: isMobile
//                                         ? 12
//                                         : (isTablet ? 13 : 14),
//                                     fontWeight: FontWeight.normal,
//                                     color: const Color(0xFF6B7280),
//                                     letterSpacing: 0.1,
//                                     height: 1.2,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: 'Good Morning! ',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: isMobile
//                                         ? 12
//                                         : (isTablet ? 13 : 14),
//                                     fontWeight: FontWeight.w600,
//                                     color: const Color(0xFF111827),
//                                     letterSpacing: 0,
//                                     height: 1.2,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: '✨',
//                                   style: TextStyle(
//                                     fontSize: isMobile
//                                         ? 12
//                                         : (isTablet ? 13 : 14),
//                                     height: 1.2,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 8),
//               // Modern date picker button
//               InkWell(
//                 onTap: () => _showDatePicker(context, viewModel),
//                 borderRadius: BorderRadius.circular(6),
//                 child: Container(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: isMobile ? 6 : 8,
//                     vertical: isMobile ? 4 : 5,
//                   ),
//                   decoration: BoxDecoration(
//                     color: selectedDate != null
//                         ? const Color(0xFF6366F1).withOpacity(0.1)
//                         : const Color(0xFFF9FAFB),
//                     borderRadius: BorderRadius.circular(6),
//                     border: Border.all(
//                       color: selectedDate != null
//                           ? const Color(0xFF6366F1)
//                           : const Color(0xFFE5E7EB),
//                       width: 1,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: const Color(0xFF000000).withOpacity(0.02),
//                         blurRadius: 2,
//                         offset: const Offset(0, 1),
//                         spreadRadius: 0,
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(2),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF6366F1).withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         child: Icon(
//                           Icons.calendar_today,
//                           color: const Color(0xFF6366F1),
//                           size: isMobile ? 9 : 10,
//                         ),
//                       ),
//                       const SizedBox(width: 4),
//                       Text(
//                         displayDate,
//                         style: TextStyle(
//                           fontFamily: 'Roboto',
//                           color: const Color(0xFF374151),
//                           fontSize: isMobile ? 10 : 11,
//                           fontWeight: FontWeight.w600,
//                           letterSpacing: 0.1,
//                           height: 1.1,
//                         ),
//                       ),
//                       if (selectedDate != null) ...[
//                         const SizedBox(width: 4),
//                         InkWell(
//                           onTap: () {
//                             viewModel.clearDateFilter();
//                           },
//                           child: Icon(
//                             Icons.close,
//                             size: isMobile ? 12 : 14,
//                             color: const Color(0xFF6366F1),
//                           ),
//                         ),
//                       ],
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildSummaryCards(AppointmentDashboardViewModel viewModel) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final summary = viewModel.summary;

//         if (constraints.maxWidth < 768) {
//           // Mobile layout - 2x2 grid
//           return Column(
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildUnifiedSummaryCard(
//                       '${summary?.todayAppointments ?? 55}',
//                       'Today\'s Appointments',
//                       const Color(0xFFB088F0),
//                       Icons.calendar_today,
//                       constraints,
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: _buildUnifiedSummaryCard(
//                       '${summary?.upcomingAppointments ?? 12}',
//                       'Upcoming Appointments',
//                       const Color(0xFFE0F0B0),
//                       Icons.calendar_month,
//                       constraints,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildUnifiedSummaryCard(
//                       '${summary?.completedAppointments ?? 34}',
//                       'Completed Appointments',
//                       const Color(0xFFB0F0B0),
//                       Icons.check_circle,
//                       constraints,
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: _buildUnifiedSummaryCard(
//                       '${summary?.cancelledAppointments ?? 9}',
//                       'Cancelled Appointments',
//                       const Color(0xFFF0B0B0),
//                       Icons.cancel,
//                       constraints,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           );
//         } else {
//           // Desktop/Tablet layout - horizontal row
//           return Row(
//             children: [
//               Expanded(
//                 child: _buildUnifiedSummaryCard(
//                   '${summary?.todayAppointments ?? 55}',
//                   'Today\'s Appointments',
//                   const Color(0xFFB088F0),
//                   Icons.calendar_today,
//                   constraints,
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: _buildUnifiedSummaryCard(
//                   '${summary?.upcomingAppointments ?? 12}',
//                   'Upcoming Appointments',
//                   const Color(0xFFE0F0B0),
//                   Icons.calendar_month,
//                   constraints,
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: _buildUnifiedSummaryCard(
//                   '${summary?.completedAppointments ?? 34}',
//                   'Completed Appointments',
//                   const Color(0xFFB0F0B0),
//                   Icons.check_circle,
//                   constraints,
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: _buildUnifiedSummaryCard(
//                   '${summary?.cancelledAppointments ?? 9}',
//                   'Cancelled Appointments',
//                   const Color(0xFFF0B0B0),
//                   Icons.cancel,
//                   constraints,
//                 ),
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }

//   Widget _buildUnifiedSummaryCard(
//     String value,
//     String label,
//     Color color,
//     IconData icon,
//     BoxConstraints constraints,
//   ) {
//     final isMobile = constraints.maxWidth < 768;
//     final cardType = _getCardType(label);

//     // Calculate consistent dimensions based on screen size
//     final cardHeight = isMobile ? 60.0 : 65.0;
//     final iconSize = isMobile ? 20.0 : 24.0;
//     final iconInnerSize = isMobile ? 10.0 : 12.0;
//     final padding = isMobile ? 6.0 : 8.0;
//     final borderRadius = 5.0; // Reduced for modern look

//     return Container(
//       height: cardHeight,
//       padding: EdgeInsets.all(padding),
//       decoration: BoxDecoration(
//         gradient: _getCardGradient(cardType, color),
//         borderRadius: BorderRadius.circular(borderRadius),
//         boxShadow: [
//           BoxShadow(
//             color: color.withOpacity(0.3),
//             blurRadius: 12,
//             offset: const Offset(0, 6),
//             spreadRadius: 0,
//           ),
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           // Unique wavy background pattern based on card type
//           Positioned(
//             right: 0,
//             top: 0,
//             bottom: 0,
//             child: CustomPaint(
//               size: Size(100, cardHeight),
//               painter: _getWavyPainter(cardType),
//             ),
//           ),
//           // Futuristic grid pattern
//           Positioned.fill(
//             child: CustomPaint(
//               painter: _GridPatternPainter(
//                 color: Colors.white.withOpacity(0.1),
//                 strokeWidth: 0.5,
//               ),
//             ),
//           ),
//           // Content
//           Row(
//             children: [
//               Container(
//                 width: iconSize,
//                 height: iconSize,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [Colors.white, Colors.white.withOpacity(0.8)],
//                   ),
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 8,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Icon(
//                   icon,
//                   size: iconInnerSize,
//                   color: _getIconColor(cardType),
//                 ),
//               ),
//               SizedBox(width: isMobile ? 8 : 10),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       value,
//                       style: TextStyle(
//                         fontSize: isMobile ? 14 : 16,
//                         fontWeight: FontWeight.w800,
//                         color: const Color(0xFF333333),
//                         letterSpacing: -0.4,
//                       ),
//                     ),
//                     SizedBox(height: isMobile ? 1 : 1),
//                     Flexible(
//                       child: Text(
//                         label,
//                         style: TextStyle(
//                           fontSize: isMobile ? 8 : 9,
//                           color: const Color(0xFF333333).withOpacity(0.8),
//                           fontWeight: FontWeight.w500,
//                           letterSpacing: 0.1,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTableControls(AppointmentDashboardViewModel viewModel) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isTablet = constraints.maxWidth < 1024;

//         return Column(
//           children: [
//             // Tabs
//             _buildTabsRow(viewModel),
//             const Divider(color: Color(0xFFE0E0E0), thickness: 1, height: 1),
//             SizedBox(height: isTablet ? 6 : 8),
//             // Search and filter controls
//             _buildSearchAndFilterRow(viewModel),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildTabsRow(AppointmentDashboardViewModel viewModel) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isTablet = constraints.maxWidth < 1024;

//         return Row(
//           children: [
//             // Tabs
//             _buildTab('All', 0, viewModel),
//             SizedBox(width: isTablet ? 6 : 8),
//             _buildTab('Patients', 1, viewModel),
//             SizedBox(width: isTablet ? 6 : 8),
//             _buildTab('Doctors', 2, viewModel),
//             const Spacer(),
//             // New Appointment Button
//             ElevatedButton.icon(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 foregroundColor: Colors.white,
//                 padding: EdgeInsets.symmetric(
//                   horizontal: isTablet ? 8 : 10,
//                   vertical: isTablet ? 3 : 4,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(isTablet ? 4 : 5),
//                 ),
//               ),
//               icon: Icon(Icons.add, size: isTablet ? 11 : 12),
//               label: Text(
//                 'New Appointment',
//                 style: TextStyle(fontSize: isTablet ? 10 : 11),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildSearchAndFilterRow(AppointmentDashboardViewModel viewModel) {
//     return Row(
//       children: [
//         // Search Bar
//         Expanded(
//           child: Container(
//             height: 32,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(color: const Color(0xFFE0E0E0)),
//               borderRadius: BorderRadius.circular(5),
//             ),
//             child: TextField(
//               onChanged: (value) => viewModel.setSearchQuery(value),
//               decoration: const InputDecoration(
//                 hintText: 'Search',
//                 hintStyle: TextStyle(fontSize: 11, color: Color(0xFF666666)),
//                 prefixIcon: Icon(
//                   Icons.search,
//                   color: Color(0xFF666666),
//                   size: 14,
//                 ),
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.symmetric(
//                   horizontal: 10,
//                   vertical: 6,
//                 ),
//                 isDense: true,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(width: 6),
//         // Filter Button
//         _buildFilterButton(),
//         const SizedBox(width: 6),
//         // View Toggle
//         _buildViewToggleButtons(viewModel),
//       ],
//     );
//   }

//   Widget _buildTab(
//     String title,
//     int index,
//     AppointmentDashboardViewModel viewModel,
//   ) {
//     final isSelected = viewModel.selectedTab == index;
//     return InkWell(
//       onTap: () => viewModel.setSelectedTab(index),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 4),
//         decoration: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: isSelected ? const Color(0xFF007BFF) : Colors.transparent,
//               width: 2,
//             ),
//           ),
//         ),
//         child: Text(
//           title,
//           style: TextStyle(
//             fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
//             color: isSelected
//                 ? const Color(0xFF007BFF)
//                 : const Color(0xFF666666),
//             fontSize: 11,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFilterButton() {
//     return Container(
//       height: 32,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: const Color(0xFFE0E0E0)),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: OutlinedButton.icon(
//         onPressed: () {},
//         style: OutlinedButton.styleFrom(
//           backgroundColor: Colors.white,
//           foregroundColor: const Color(0xFF666666),
//           side: BorderSide.none,
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//         ),
//         icon: const Icon(Icons.keyboard_arrow_down, size: 14),
//         label: const Text('Filter', style: TextStyle(fontSize: 11)),
//       ),
//     );
//   }

//   Widget _buildSortableHeader(String title) {
//     return Text(
//       title,
//       style: const TextStyle(
//         fontWeight: FontWeight.w600,
//         fontSize: 10,
//         color: Color(0xFF333333),
//       ),
//       overflow: TextOverflow.ellipsis,
//       maxLines: 1,
//     );
//   }

//   Widget _buildViewToggleButtons(AppointmentDashboardViewModel viewModel) {
//     return Row(
//       children: [
//         _buildViewToggle(Icons.view_list, true, viewModel),
//         const SizedBox(width: 2),
//         _buildViewToggle(Icons.grid_view, false, viewModel),
//       ],
//     );
//   }

//   Widget _buildViewToggle(
//     IconData icon,
//     bool isList,
//     AppointmentDashboardViewModel viewModel,
//   ) {
//     return Container(
//       height: 32,
//       width: 32,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: const Color(0xFFE0E0E0)),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: InkWell(
//         onTap: () => viewModel.toggleViewMode(),
//         borderRadius: BorderRadius.circular(5),
//         child: Icon(icon, size: 14, color: const Color(0xFF666666)),
//       ),
//     );
//   }

//   Widget _buildAppointmentsTable(AppointmentDashboardViewModel viewModel) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: const Color(0xFFE0E0E0)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.02),
//             blurRadius: 4,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       ),
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           // Define minimum width needed for all columns
//           const double minTableWidth = 1000.0;

//           // Show empty state if no appointments
//           if (viewModel.paginatedSimpleAppointments.isEmpty) {
//             return Column(
//               children: [
//                 // Show table headers even when empty
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: SizedBox(
//                     width: constraints.maxWidth >= minTableWidth
//                         ? constraints.maxWidth
//                         : minTableWidth,
//                     child: DataTable(
//                       headingRowColor: WidgetStateProperty.all(
//                         const Color(0xFFF8F9FA),
//                       ),
//                       headingRowHeight: 36,
//                       horizontalMargin: constraints.maxWidth < 1200 ? 4 : 8,
//                       columnSpacing: constraints.maxWidth < 1200 ? 4 : 8,
//                       headingTextStyle: const TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 10,
//                         color: Color(0xFF333333),
//                       ),
//                       columns: [
//                         DataColumn(label: _buildSortableHeader('Token')),
//                         DataColumn(label: _buildSortableHeader('Mo ID')),
//                         DataColumn(label: _buildSortableHeader('Patient Name')),
//                         DataColumn(label: _buildSortableHeader('Doctors Name')),
//                         DataColumn(label: _buildSortableHeader('Department')),
//                         DataColumn(
//                           label: _buildSortableHeader('Consultation Type'),
//                         ),
//                         DataColumn(
//                           label: _buildSortableHeader(
//                             'Appointment Date & Time',
//                           ),
//                         ),
//                         DataColumn(label: _buildSortableHeader('STATUS')),
//                         DataColumn(label: _buildSortableHeader('Fee Status')),
//                         DataColumn(label: Text('')),
//                       ],
//                       rows: [],
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           }

//           // If screen is wide enough, display without scrolling
//           if (constraints.maxWidth >= minTableWidth) {
//             return SizedBox(
//               width: constraints.maxWidth,
//               child: DataTable(
//                 headingRowColor: WidgetStateProperty.all(
//                   const Color(0xFFF8F9FA),
//                 ),
//                 headingRowHeight: 36,
//                 horizontalMargin: constraints.maxWidth < 1200 ? 4 : 8,
//                 columnSpacing: constraints.maxWidth < 1200 ? 4 : 8,
//                 headingTextStyle: const TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 10,
//                   color: Color(0xFF333333),
//                 ),
//                 dataTextStyle: const TextStyle(
//                   fontSize: 10,
//                   color: Color(0xFF333333),
//                 ),
//                 dividerThickness: 1,
//                 dataRowMinHeight: 42,
//                 dataRowMaxHeight: 42,
//                 columns: [
//                   DataColumn(label: _buildSortableHeader('Token')),
//                   DataColumn(label: _buildSortableHeader('Mo ID')),
//                   DataColumn(label: _buildSortableHeader('Patient Name')),
//                   DataColumn(label: _buildSortableHeader('Doctors Name')),
//                   DataColumn(label: _buildSortableHeader('Department')),
//                   DataColumn(label: _buildSortableHeader('Consultation Type')),
//                   DataColumn(
//                     label: _buildSortableHeader('Appointment Date & Time'),
//                   ),
//                   DataColumn(label: _buildSortableHeader('STATUS')),
//                   DataColumn(label: _buildSortableHeader('Fee Status')),
//                   DataColumn(label: Text('')),
//                 ],
//                 rows: viewModel.paginatedSimpleAppointments.asMap().entries.map(
//                   (entry) {
//                     final index = entry.key;
//                     final appointment = entry.value;
//                     final globalIndex =
//                         (viewModel.currentSimplePage - 1) *
//                             viewModel.itemsPerPage +
//                         index +
//                         1;
//                     return _buildDataTableRow(
//                       globalIndex,
//                       appointment,
//                       viewModel,
//                     );
//                   },
//                 ).toList(),
//               ),
//             );
//           }
//           // For smaller screens, enable horizontal scrolling
//           else {
//             return SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: SizedBox(
//                 width: minTableWidth,
//                 child: DataTable(
//                   headingRowColor: WidgetStateProperty.all(
//                     const Color(0xFFF8F9FA),
//                   ),
//                   headingRowHeight: 36,
//                   horizontalMargin: 4,
//                   columnSpacing: 4,
//                   headingTextStyle: const TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 10,
//                     color: Color(0xFF333333),
//                   ),
//                   dataTextStyle: const TextStyle(
//                     fontSize: 10,
//                     color: Color(0xFF333333),
//                   ),
//                   dividerThickness: 1,
//                   dataRowMinHeight: 42,
//                   dataRowMaxHeight: 42,
//                   columns: [
//                     DataColumn(label: _buildSortableHeader('#')),
//                     DataColumn(label: _buildSortableHeader('Mo ID')),
//                     DataColumn(label: _buildSortableHeader('Patient Name')),
//                     DataColumn(label: _buildSortableHeader('Doctors Name')),
//                     DataColumn(label: _buildSortableHeader('Department')),
//                     DataColumn(
//                       label: _buildSortableHeader('Consultation Type'),
//                     ),
//                     DataColumn(
//                       label: _buildSortableHeader('Appointment Date & Time'),
//                     ),
//                     DataColumn(label: _buildSortableHeader('STATUS')),
//                     DataColumn(label: _buildSortableHeader('Fee Status')),
//                     DataColumn(label: Text('')),
//                   ],
//                   rows: viewModel.paginatedSimpleAppointments
//                       .asMap()
//                       .entries
//                       .map((entry) {
//                         final index = entry.key;
//                         final appointment = entry.value;
//                         final globalIndex =
//                             (viewModel.currentSimplePage - 1) *
//                                 viewModel.itemsPerPage +
//                             index +
//                             1;
//                         return _buildDataTableRow(
//                           globalIndex,
//                           appointment,
//                           viewModel,
//                         );
//                       })
//                       .toList(),
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }

//   DataRow _buildDataTableRow(
//     int index,
//     dynamic appointment,
//     AppointmentDashboardViewModel viewModel,
//   ) {
//     // Use AppointmentListItem data from simple API
//     final tokenNumber = appointment?.tokenNumber ?? index;
//     final moId = appointment?.moId ?? _getMoIdForRow(index);
//     var patientName = appointment?.patientName ?? 'Unknown Patient';
//     // Remove "(Patient)" suffix from patient name if present
//     if (patientName.contains('(Patient)')) {
//       patientName = patientName.replaceAll('(Patient)', '').trim();
//     }
//     final patientPhone = '-'; // Not available in simple API
//     final doctorName = appointment?.doctorName ?? _getDoctorNameForRow(index);
//     final department = appointment?.department ?? _getDepartmentForRow(index);
//     final consultationType =
//         appointment?.consultationType ?? _getConsultationTypeForRow(index);
//     // Split the combined appointmentDateTime field manually
//     String appointmentDate = '';
//     String appointmentTime = '';
//     if (appointment?.appointmentDateTime != null &&
//         appointment!.appointmentDateTime.contains(' ')) {
//       final parts = appointment.appointmentDateTime.split(' ');
//       appointmentDate = parts[0]; // YYYY-MM-DD
//       appointmentTime = parts.length > 1 ? parts[1] : ''; // HH:MM:SS
//     }
//     final appointmentDateTime = appointment?.appointmentDateTime ?? '';
//     final status = appointment?.status ?? _getStatusForRow(index);
//     final feeStatus = appointment?.feeStatus ?? '';
//     final feeAmount = appointment?.feeAmount;
//     final paymentStatus = appointment?.paymentStatus ?? 'pending';

//     return DataRow(
//       color: WidgetStateProperty.resolveWith<Color?>(
//         (Set<WidgetState> states) => Colors.white,
//       ),
//       cells: [
//         DataCell(Text(tokenNumber != null ? '#${tokenNumber}' : '-')),
//         DataCell(Text(moId ?? '')),
//         DataCell(_buildPatientProfileCell(patientName, patientPhone)),
//         DataCell(Text(doctorName ?? '')),
//         DataCell(Text(department ?? 'N/A')),
//         DataCell(_buildConsultationTypePill(consultationType ?? '')),
//         DataCell(
//           appointmentDate.isNotEmpty
//               ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(appointmentDate, style: const TextStyle(fontSize: 10)),
//                     Text(
//                       appointmentTime,
//                       style: const TextStyle(
//                         fontSize: 9,
//                         color: Color(0xFF666666),
//                       ),
//                     ),
//                   ],
//                 )
//               : Text(appointmentDateTime),
//         ),
//         DataCell(_buildStatusChip(status ?? '')),
//         DataCell(_buildFeeStatusCell(feeStatus, feeAmount, paymentStatus)),
//         DataCell(
//           IconButton(
//             onPressed: () {
//               // Navigate to appointment details
//               if (appointment?.id != null) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AppointmentDetailsScreen(
//                       appointmentId: appointment!.id!,
//                     ),
//                   ),
//                 );
//               }
//             },
//             icon: const Icon(
//               Icons.more_vert,
//               size: 16,
//               color: Color(0xFF666666),
//             ),
//             padding: EdgeInsets.zero,
//             constraints: const BoxConstraints(),
//           ),
//         ),
//       ],
//     );
//   }

//   String _getDepartmentForRow(int index) {
//     const departments = [
//       'Cardiology',
//       'Dermatology',
//       'Neurology',
//       'Cardiology',
//       'Dermatology',
//       'Cardiology',
//       'Cardiology',
//       'Dermatology',
//       'Orthopedics',
//       'Pediatrics',
//     ];
//     return departments[index % departments.length];
//   }

//   String _getConsultationTypeForRow(int index) {
//     const types = [
//       'Clinic Visit',
//       'Follow Up',
//       'Online Consultation',
//       'Clinic Visit',
//       'Follow Up',
//       'Clinic Visit',
//       'Online Consultation',
//       'Clinic Visit',
//       'Follow Up',
//       'Online Consultation',
//     ];
//     return types[index % types.length];
//   }

//   String _getStatusForRow(int index) {
//     const statuses = [
//       'Upcoming',
//       'Completed',
//       'Cancelled',
//       'Cancelled',
//       'Cancelled',
//       'Upcoming',
//       'Completed',
//       'Cancelled',
//       'Upcoming',
//       'Completed',
//     ];
//     return statuses[index % statuses.length];
//   }

//   String _getMoIdForRow(int index) {
//     const ids = [
//       '#23454G',
//       '#23455H',
//       '#23456I',
//       '#23457J',
//       '#23458K',
//       '#23459L',
//       '#23460M',
//       '#23461N',
//       '#23462O',
//       '#23463P',
//     ];
//     return ids[index % ids.length];
//   }

//   String _getDoctorNameForRow(int index) {
//     const doctors = [
//       'Dr. Alan Green',
//       'Dr. Maria Garcia',
//       'Dr. David Wilson',
//       'Dr. Lisa Brown',
//       'Dr. Robert Taylor',
//       'Dr. Jennifer Lee',
//       'Dr. Alex Johnson',
//       'Dr. Sarah White',
//       'Dr. James Miller',
//       'Dr. Emma Davis',
//     ];
//     return doctors[index % doctors.length];
//   }

//   // Patient profile cell with name and phone number
//   Widget _buildPatientProfileCell(String? patientName, String? phoneNumber) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         // Profile Icon (Circular)
//         Container(
//           width: 24,
//           height: 24,
//           decoration: BoxDecoration(
//             color: const Color(0xFFF0F0F0),
//             shape: BoxShape.circle,
//             border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
//           ),
//           child: const Icon(Icons.person, size: 12, color: Color(0xFF666666)),
//         ),
//         const SizedBox(width: 4),
//         // Name and Phone
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               patientName ?? 'Unknown',
//               style: const TextStyle(
//                 fontSize: 10,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF333333),
//               ),
//             ),
//             const SizedBox(height: 1),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Icon(Icons.phone, size: 8, color: Color(0xFF10B981)),
//                 const SizedBox(width: 2),
//                 Text(
//                   phoneNumber ?? 'N/A',
//                   style: const TextStyle(
//                     fontSize: 8,
//                     color: Color(0xFF666666),
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   // New method that accepts fee data as parameters
//   Widget _buildFeeStatusCell(
//     String? feeStatus,
//     double? feeAmount,
//     String? paymentStatus,
//   ) {
//     // If payment is paid, show the fee amount
//     if (paymentStatus == 'paid' || feeStatus?.contains('₹') == true) {
//       return Text(
//         feeStatus ??
//             (feeAmount != null ? '₹${feeAmount.toStringAsFixed(2)}' : '₹0.00'),
//         style: const TextStyle(color: Color(0xFF333333), fontSize: 10),
//       );
//     } else {
//       // If payment is pending, show "Pay Now" link
//       return GestureDetector(
//         onTap: () {
//           // Navigate to payment screen
//         },
//         child: Text(
//           feeStatus ?? 'Pay Now',
//           style: const TextStyle(
//             color: Color(0xFF007BFF),
//             fontSize: 10,
//             decoration: TextDecoration.underline,
//           ),
//         ),
//       );
//     }
//   }

//   Widget _buildConsultationTypePill(String type) {
//     Color backgroundColor;
//     Color textColor;
//     IconData icon;

//     switch (type.toLowerCase()) {
//       case 'clinic visit':
//         backgroundColor = const Color(0xFFE3F2FD);
//         textColor = const Color(0xFF1976D2);
//         icon = Icons.local_hospital;
//         break;
//       case 'follow up':
//         backgroundColor = const Color(0xFFF3E5F5);
//         textColor = const Color(0xFF7B1FA2);
//         icon = Icons.calendar_today;
//         break;
//       case 'online consultation':
//         backgroundColor = const Color(0xFFE8F5E8);
//         textColor = const Color(0xFF2E7D32);
//         icon = Icons.videocam;
//         break;
//       default:
//         backgroundColor = const Color(0xFFE3F2FD);
//         textColor = const Color(0xFF1976D2);
//         icon = Icons.local_hospital;
//     }

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, size: 9, color: textColor),
//           const SizedBox(width: 2),
//           Flexible(
//             child: Text(
//               type,
//               style: TextStyle(
//                 color: textColor,
//                 fontSize: 8,
//                 fontWeight: FontWeight.w500,
//               ),
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStatusChip(String status) {
//     Color textColor;
//     Color dotColor;
//     Color backgroundColor;

//     switch (status) {
//       case 'Upcoming':
//         textColor = const Color(0xFFF57C00);
//         dotColor = const Color(0xFFFFC107);
//         backgroundColor = const Color(0xFFFFF3E0);
//         break;
//       case 'Completed':
//         textColor = const Color(0xFF2E7D32);
//         dotColor = const Color(0xFF4CAF50);
//         backgroundColor = const Color(0xFFE8F5E8);
//         break;
//       case 'Cancelled':
//         textColor = const Color(0xFFD32F2F);
//         dotColor = const Color(0xFFF44336);
//         backgroundColor = const Color(0xFFFFEBEE);
//         break;
//       default:
//         textColor = const Color(0xFF666666);
//         dotColor = const Color(0xFF666666);
//         backgroundColor = const Color(0xFFF5F5F5);
//     }

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             width: 5,
//             height: 5,
//             decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
//           ),
//           const SizedBox(width: 3),
//           Text(
//             status,
//             style: TextStyle(
//               color: textColor,
//               fontSize: 9,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPagination(AppointmentDashboardViewModel viewModel) {
//     if (viewModel.simpleAppointments.isEmpty ||
//         viewModel.totalSimplePages <= 1) {
//       return const SizedBox.shrink();
//     }

//     final currentPage = viewModel.currentSimplePage;
//     final totalPages = viewModel.totalSimplePages;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         // Previous button
//         IconButton(
//           onPressed: currentPage > 1 ? viewModel.previousSimplePage : null,
//           icon: const Icon(Icons.chevron_left, size: 20),
//           color: currentPage > 1
//               ? const Color(0xFF666666)
//               : const Color(0xFFCCCCCC),
//           tooltip: 'Previous page',
//         ),
//         const SizedBox(width: 8),

//         // Page numbers
//         ..._buildPageNumbers(viewModel, currentPage, totalPages),

//         const SizedBox(width: 8),
//         // Next button
//         IconButton(
//           onPressed: currentPage < totalPages ? viewModel.nextSimplePage : null,
//           icon: const Icon(Icons.chevron_right, size: 20),
//           color: currentPage < totalPages
//               ? const Color(0xFF666666)
//               : const Color(0xFFCCCCCC),
//           tooltip: 'Next page',
//         ),
//       ],
//     );
//   }

//   List<Widget> _buildPageNumbers(
//     AppointmentDashboardViewModel viewModel,
//     int currentPage,
//     int totalPages,
//   ) {
//     List<Widget> pageNumbers = [];

//     // Always show first page
//     if (currentPage > 3) {
//       pageNumbers.add(_buildPageNumber(1, false, viewModel));
//       if (currentPage > 4) {
//         pageNumbers.add(
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 4),
//             child: Text('...', style: TextStyle(color: Color(0xFF666666))),
//           ),
//         );
//       }
//     }

//     // Show pages around current page
//     for (
//       int i = max(1, currentPage - 2);
//       i <= min(totalPages, currentPage + 2);
//       i++
//     ) {
//       pageNumbers.add(_buildPageNumber(i, i == currentPage, viewModel));
//       if (i < min(totalPages, currentPage + 2)) {
//         pageNumbers.add(const SizedBox(width: 4));
//       }
//     }

//     // Always show last page
//     if (currentPage < totalPages - 2) {
//       if (currentPage < totalPages - 3) {
//         pageNumbers.add(
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 4),
//             child: Text('...', style: TextStyle(color: Color(0xFF666666))),
//           ),
//         );
//       }
//       pageNumbers.add(_buildPageNumber(totalPages, false, viewModel));
//     }

//     return pageNumbers;
//   }

//   Widget _buildPageNumber(
//     int number,
//     bool isActive,
//     AppointmentDashboardViewModel viewModel,
//   ) {
//     return InkWell(
//       onTap: () => viewModel.goToSimplePage(number),
//       child: Container(
//         width: 36,
//         height: 36,
//         decoration: BoxDecoration(
//           color: isActive ? const Color(0xFF2196F3) : Colors.white,
//           borderRadius: BorderRadius.circular(4),
//           border: Border.all(
//             color: isActive ? const Color(0xFF2196F3) : const Color(0xFFE0E0E0),
//           ),
//         ),
//         child: Center(
//           child: Text(
//             number.toString(),
//             style: TextStyle(
//               color: isActive ? Colors.white : const Color(0xFF333333),
//               fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
//               fontSize: 14,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFooter() {
//     return const Center(
//       child: Text(
//         'Copyright © 2025 DrMe. All rights reserved',
//         style: TextStyle(color: Color(0xFF999999), fontSize: 10),
//       ),
//     );
//   }

//   Widget _buildMobileSummaryCards(AppointmentDashboardViewModel viewModel) {
//     final summary = viewModel.summary;
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             children: [
//               // First row
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildUnifiedSummaryCard(
//                       '${summary?.todayAppointments ?? 55}',
//                       'Today\'s Appointments',
//                       const Color(0xFFB088F0),
//                       Icons.calendar_today,
//                       constraints,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: _buildUnifiedSummaryCard(
//                       '${summary?.upcomingAppointments ?? 12}',
//                       'Upcoming Appointments',
//                       const Color(0xFFE0F0B0),
//                       Icons.calendar_month,
//                       constraints,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               // Second row
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildUnifiedSummaryCard(
//                       '${summary?.completedAppointments ?? 34}',
//                       'Completed Appointments',
//                       const Color(0xFFB0F0B0),
//                       Icons.check_circle,
//                       constraints,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: _buildUnifiedSummaryCard(
//                       '${summary?.cancelledAppointments ?? 9}',
//                       'Cancelled Appointments',
//                       const Color(0xFFF0B0B0),
//                       Icons.cancel,
//                       constraints,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildMobileTabsAndActions(AppointmentDashboardViewModel viewModel) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Row(
//         children: [
//           // Tabs with horizontal scroll
//           Expanded(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   _buildMobileTab('All', 0, viewModel),
//                   const SizedBox(width: 12),
//                   _buildMobileTab('Patients', 1, viewModel),
//                   const SizedBox(width: 12),
//                   _buildMobileTab('Doctors', 2, viewModel),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(width: 8),
//           // Date picker button
//           Container(
//             constraints: const BoxConstraints(minWidth: 100, maxWidth: 120),
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(color: const Color(0xFFE0E0E0)),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Icon(
//                   Icons.calendar_today,
//                   color: Color(0xFF666666),
//                   size: 14,
//                 ),
//                 const SizedBox(width: 4),
//                 const Text(
//                   '12-03-2025',
//                   style: TextStyle(
//                     color: Color(0xFF333333),
//                     fontSize: 12,
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 8),
//           // New Appointment button
//           Container(
//             width: 36,
//             height: 36,
//             decoration: const BoxDecoration(
//               color: Colors.black,
//               shape: BoxShape.circle,
//             ),
//             child: const Icon(Icons.add, color: Colors.white, size: 18),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMobileTab(
//     String title,
//     int index,
//     AppointmentDashboardViewModel viewModel,
//   ) {
//     final isSelected = viewModel.selectedTab == index;
//     return InkWell(
//       onTap: () => viewModel.setSelectedTab(index),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 8),
//         decoration: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: isSelected ? const Color(0xFF007BFF) : Colors.transparent,
//               width: 2,
//             ),
//           ),
//         ),
//         child: Text(
//           title,
//           style: TextStyle(
//             fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
//             color: isSelected
//                 ? const Color(0xFF007BFF)
//                 : const Color(0xFF666666),
//             fontSize: 14,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMobileSearchAndFilter() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Row(
//         children: [
//           // Search bar
//           Expanded(
//             child: Container(
//               height: 40,
//               constraints: const BoxConstraints(
//                 minWidth: 0,
//                 maxWidth: double.infinity,
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: const Color(0xFFE0E0E0)),
//               ),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search Doctors, P...',
//                   hintStyle: const TextStyle(
//                     color: Color(0xFF999999),
//                     fontSize: 14,
//                   ),
//                   prefixIcon: const Icon(
//                     Icons.search,
//                     color: Color(0xFF666666),
//                     size: 20,
//                   ),
//                   border: InputBorder.none,
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 10,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 12),
//           // Filter button
//           Container(
//             height: 40,
//             constraints: const BoxConstraints(minWidth: 80, maxWidth: 120),
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(color: const Color(0xFFE0E0E0)),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Icon(
//                   Icons.filter_list,
//                   color: Color(0xFF666666),
//                   size: 16,
//                 ),
//                 const SizedBox(width: 6),
//                 const Text(
//                   'Filter',
//                   style: TextStyle(
//                     color: Color(0xFF666666),
//                     fontSize: 12,
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMobileAppointmentCards(AppointmentDashboardViewModel viewModel) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         children: viewModel.paginatedSimpleAppointments.map((appointment) {
//           // Extract data from appointment
//           final moId = appointment.moId ?? 'N/A';
//           var patientName = appointment.patientName;
//           if (patientName.contains('(Patient)')) {
//             patientName = patientName.replaceAll('(Patient)', '').trim();
//           }
//           final consultationType = appointment.consultationType;
//           final doctorName = appointment.doctorName;
//           final department = appointment.department ?? 'General';
//           final status = appointment.status;
//           final feeStatus = appointment.feeStatus;

//           // Determine status color
//           Color statusColor;
//           switch (status) {
//             case 'Completed':
//               statusColor = const Color(0xFF28A745);
//               break;
//             case 'Cancelled':
//               statusColor = const Color(0xFFDC3545);
//               break;
//             case 'Upcoming':
//             default:
//               statusColor = const Color(0xFFFFC107);
//           }

//           return Padding(
//             padding: const EdgeInsets.only(bottom: 12),
//             child: _buildMobileAppointmentCard(
//               moId,
//               patientName,
//               consultationType,
//               doctorName,
//               department,
//               status,
//               statusColor,
//               fee: feeStatus,
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }

//   Widget _buildMobileAppointmentCard(
//     String appointmentId,
//     String patientName,
//     String type,
//     String doctorName,
//     String department,
//     String status,
//     Color statusColor, {
//     String? fee,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 8,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // Top row: Appointment ID + Status + Kebab menu
//           Row(
//             children: [
//               // Appointment ID
//               Text(
//                 appointmentId,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF333333),
//                 ),
//               ),
//               const Spacer(),
//               // Status indicator
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: statusColor,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       width: 6,
//                       height: 6,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       status,
//                       style: const TextStyle(
//                         fontSize: 10,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 8),
//               // Kebab menu
//               Icon(Icons.more_vert, color: const Color(0xFF666666), size: 18),
//             ],
//           ),
//           const SizedBox(height: 12),
//           // Middle section: Patient info (left) + Doctor info (right)
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Left column - Patient info
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                         children: [
//                           const TextSpan(
//                             text: 'Patient: ',
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Color(0xFF666666),
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           TextSpan(
//                             text: patientName,
//                             style: const TextStyle(
//                               fontSize: 13,
//                               color: Color(0xFF333333),
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 6),
//                     RichText(
//                       text: TextSpan(
//                         children: [
//                           const TextSpan(
//                             text: 'Type: ',
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Color(0xFF666666),
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           TextSpan(
//                             text: type,
//                             style: const TextStyle(
//                               fontSize: 13,
//                               color: Color(0xFF333333),
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 16),
//               // Right column - Doctor info
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                         children: [
//                           const TextSpan(
//                             text: 'Doctors: ',
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Color(0xFF666666),
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           TextSpan(
//                             text: doctorName,
//                             style: const TextStyle(
//                               fontSize: 13,
//                               color: Color(0xFF333333),
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 6),
//                     RichText(
//                       text: TextSpan(
//                         children: [
//                           const TextSpan(
//                             text: 'Department: ',
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Color(0xFF666666),
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           TextSpan(
//                             text: department,
//                             style: const TextStyle(
//                               fontSize: 13,
//                               color: Color(0xFF333333),
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           // Bottom row: Pay Now link (left) + Fee (right)
//           Row(
//             children: [
//               // Pay Now link
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const AppointmentDetailsScreen(
//                         appointmentId: '23454G',
//                       ),
//                     ),
//                   );
//                 },
//                 style: TextButton.styleFrom(
//                   padding: EdgeInsets.zero,
//                   minimumSize: const Size(60, 32),
//                 ),
//                 child: const Text(
//                   'Pay Now',
//                   style: TextStyle(
//                     color: Color(0xFF007BFF),
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               // Fee display (if provided)
//               if (fee != null)
//                 Text(
//                   fee,
//                   style: const TextStyle(
//                     color: Color(0xFF28A745),
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper methods for card styling
//   String _getCardType(String label) {
//     if (label.contains('Today')) return 'today';
//     if (label.contains('Upcoming')) return 'upcoming';
//     if (label.contains('Completed')) return 'completed';
//     if (label.contains('Cancelled')) return 'cancelled';
//     return 'default';
//   }

//   LinearGradient _getCardGradient(String cardType, Color baseColor) {
//     switch (cardType) {
//       case 'today':
//         return LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             const Color(0xFFE8D5FF), // Very light purple
//             const Color(0xFFD1B3FF), // Light purple
//             const Color(0xFFB088F0), // Original purple
//           ],
//         );
//       case 'upcoming':
//         return LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             const Color(0xFFF0F8D1), // Very light green
//             const Color(0xFFE8F0B0), // Light green
//             const Color(0xFFE0F0B0), // Original light green
//           ],
//         );
//       case 'completed':
//         return LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             const Color(0xFFD1F0D1), // Very light green
//             const Color(0xFFB8E8B8), // Light green
//             const Color(0xFFB0F0B0), // Original green
//           ],
//         );
//       case 'cancelled':
//         return LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             const Color(0xFFF8D1D1), // Very light pink
//             const Color(0xFFF0B8B8), // Light pink
//             const Color(0xFFF0B0B0), // Original pink
//           ],
//         );
//       default:
//         return LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [baseColor, baseColor.withOpacity(0.8)],
//         );
//     }
//   }

//   Color _getIconColor(String cardType) {
//     switch (cardType) {
//       case 'today':
//         return const Color(0xFFB088F0);
//       case 'upcoming':
//         return const Color(0xFFE0F0B0);
//       case 'completed':
//         return const Color(0xFFB0F0B0);
//       case 'cancelled':
//         return const Color(0xFFF0B0B0);
//       default:
//         return const Color(0xFF333333);
//     }
//   }

//   CustomPainter _getWavyPainter(String cardType) {
//     switch (cardType) {
//       case 'today':
//         return _TodayWavyPainter();
//       case 'upcoming':
//         return _UpcomingWavyPainter();
//       case 'completed':
//         return _CompletedWavyPainter();
//       case 'cancelled':
//         return _CancelledWavyPainter();
//       default:
//         return _DefaultWavyPainter();
//     }
//   }

//   // Helper method to format date
//   String _formatDate(DateTime date) {
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
//     return '${date.day} ${months[date.month - 1]} ${date.year}';
//   }

//   // Show date picker
//   Future<void> _showDatePicker(
//     BuildContext context,
//     AppointmentDashboardViewModel viewModel,
//   ) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: viewModel.selectedDate != null
//           ? DateTime.parse(viewModel.selectedDate!)
//           : DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2030),
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: const ColorScheme.light(
//               primary: Color(0xFF6366F1),
//               onPrimary: Colors.white,
//               surface: Colors.white,
//               onSurface: Color(0xFF374151),
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );

//     if (picked != null) {
//       final formattedDate =
//           '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
//       viewModel.setDateFilter(formattedDate);
//     }
//   }

//   @override
//   void dispose() {
//     _viewModel.dispose();
//     super.dispose();
//   }
// }

// /// Grid pattern painter for futuristic look
// class _GridPatternPainter extends CustomPainter {
//   final Color color;
//   final double strokeWidth;

//   _GridPatternPainter({required this.color, required this.strokeWidth});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..strokeWidth = strokeWidth
//       ..style = PaintingStyle.stroke;

//     const double spacing = 20.0;

//     // Draw vertical lines
//     for (double x = 0; x < size.width; x += spacing) {
//       canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
//     }

//     // Draw horizontal lines
//     for (double y = 0; y < size.height; y += spacing) {
//       canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// /// Today's Appointments - Calendar wave pattern
// class _TodayWavyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white.withOpacity(0.25)
//       ..style = PaintingStyle.fill;

//     final wavePaint = Paint()
//       ..color = Colors.white.withOpacity(0.4)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1.5;

//     final path = Path();
//     final waveHeight = size.height * 0.4;

//     path.moveTo(0, size.height);

//     // Calendar-like wave pattern
//     for (double x = 0; x <= size.width; x += 6) {
//       final y =
//           size.height -
//           waveHeight +
//           (waveHeight * 0.3 * sin(x / size.width * 4 * pi)) +
//           (waveHeight * 0.2 * sin(x / size.width * 8 * pi));
//       path.lineTo(x, y);
//     }

//     path.lineTo(size.width, size.height);
//     path.close();

//     canvas.drawPath(path, paint);

//     // Draw wave line
//     final wavePath = Path();
//     wavePath.moveTo(
//       0,
//       size.height -
//           waveHeight +
//           (waveHeight * 0.3 * sin(0)) +
//           (waveHeight * 0.2 * sin(0)),
//     );

//     for (double x = 0; x <= size.width; x += 2) {
//       final y =
//           size.height -
//           waveHeight +
//           (waveHeight * 0.3 * sin(x / size.width * 4 * pi)) +
//           (waveHeight * 0.2 * sin(x / size.width * 8 * pi));
//       wavePath.lineTo(x, y);
//     }

//     canvas.drawPath(wavePath, wavePaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// /// Upcoming Appointments - Rising wave pattern
// class _UpcomingWavyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white.withOpacity(0.22)
//       ..style = PaintingStyle.fill;

//     final wavePaint = Paint()
//       ..color = Colors.white.withOpacity(0.35)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1.5;

//     final path = Path();
//     final waveHeight = size.height * 0.5;

//     path.moveTo(0, size.height);

//     // Rising wave pattern
//     for (double x = 0; x <= size.width; x += 5) {
//       final y =
//           size.height -
//           waveHeight +
//           (waveHeight * 0.4 * sin(x / size.width * 3 * pi)) +
//           (x / size.width * waveHeight * 0.3);
//       path.lineTo(x, y);
//     }

//     path.lineTo(size.width, size.height);
//     path.close();

//     canvas.drawPath(path, paint);

//     // Draw wave line
//     final wavePath = Path();
//     wavePath.moveTo(
//       0,
//       size.height -
//           waveHeight +
//           (waveHeight * 0.4 * sin(0)) +
//           (0 / size.width * waveHeight * 0.3),
//     );

//     for (double x = 0; x <= size.width; x += 2) {
//       final y =
//           size.height -
//           waveHeight +
//           (waveHeight * 0.4 * sin(x / size.width * 3 * pi)) +
//           (x / size.width * waveHeight * 0.3);
//       wavePath.lineTo(x, y);
//     }

//     canvas.drawPath(wavePath, wavePaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// /// Completed Appointments - Checkmark r
// class _CompletedWavyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white.withOpacity(0.28)
//       ..style = PaintingStyle.fill;

//     final wavePaint = Paint()
//       ..color = Colors.white.withOpacity(0.4)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1.5;

//     final path = Path();
//     final waveHeight = size.height * 0.35;

//     path.moveTo(0, size.height);

//     // Checkmark-like wave pattern
//     for (double x = 0; x <= size.width; x += 8) {
//       final y =
//           size.height -
//           waveHeight +
//           (waveHeight * 0.5 * sin(x / size.width * 2 * pi)) +
//           (waveHeight * 0.3 * sin(x / size.width * 6 * pi));
//       path.lineTo(x, y);
//     }

//     path.lineTo(size.width, size.height);
//     path.close();

//     canvas.drawPath(path, paint);

//     // Draw wave line
//     final wavePath = Path();
//     wavePath.moveTo(
//       0,
//       size.height -
//           waveHeight +
//           (waveHeight * 0.5 * sin(0)) +
//           (waveHeight * 0.3 * sin(0)),
//     );

//     for (double x = 0; x <= size.width; x += 2) {
//       final y =
//           size.height -
//           waveHeight +
//           (waveHeight * 0.5 * sin(x / size.width * 2 * pi)) +
//           (waveHeight * 0.3 * sin(x / size.width * 6 * pi));
//       wavePath.lineTo(x, y);
//     }

//     canvas.drawPath(wavePath, wavePaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// /// Cancelled Appointments - Cross wave pattern
// class _CancelledWavyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white.withOpacity(0.2)
//       ..style = PaintingStyle.fill;

//     final wavePaint = Paint()
//       ..color = Colors.white.withOpacity(0.3)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1.5;

//     final path = Path();
//     final waveHeight = size.height * 0.45;

//     path.moveTo(0, size.height);

//     // Cross-like wave pattern
//     for (double x = 0; x <= size.width; x += 6) {
//       final y =
//           size.height -
//           waveHeight +
//           (waveHeight * 0.6 * sin(x / size.width * 5 * pi)) +
//           (waveHeight * 0.2 * sin(x / size.width * 10 * pi));
//       path.lineTo(x, y);
//     }

//     path.lineTo(size.width, size.height);
//     path.close();

//     canvas.drawPath(path, paint);

//     // Draw wave line
//     final wavePath = Path();
//     wavePath.moveTo(
//       0,
//       size.height -
//           waveHeight +
//           (waveHeight * 0.6 * sin(0)) +
//           (waveHeight * 0.2 * sin(0)),
//     );

//     for (double x = 0; x <= size.width; x += 2) {
//       final y =
//           size.height -
//           waveHeight +
//           (waveHeight * 0.6 * sin(x / size.width * 5 * pi)) +
//           (waveHeight * 0.2 * sin(x / size.width * 10 * pi));
//       wavePath.lineTo(x, y);
//     }

//     canvas.drawPath(wavePath, wavePaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// /// Default wave pattern
// class _DefaultWavyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white.withOpacity(0.2)
//       ..style = PaintingStyle.fill;

//     final path = Path();
//     final waveHeight = size.height * 0.3;

//     path.moveTo(0, size.height);

//     for (double x = 0; x <= size.width; x += 10) {
//       final y =
//           size.height -
//           waveHeight +
//           (waveHeight * 0.5 * (1 + sin(x / size.width * 2 * pi)));
//       path.lineTo(x, y);
//     }

//     path.lineTo(size.width, size.height);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
