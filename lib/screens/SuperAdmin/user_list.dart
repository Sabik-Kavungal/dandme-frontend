// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:a/viewModels/clinic_vm.dart';

// import 'package:a/models/clinic_model.dart';

// class UsersListScreen extends StatefulWidget {
//   @override
//   _UsersListScreenState createState() => _UsersListScreenState();
// }

// class _UsersListScreenState extends State<UsersListScreen> {
//   List<Map<String, String>> users = [
//     {"name": "Dr. John Doe", "email": "john@clinic.com", "role": "doctor"},
//     {"name": "Patient Jane", "email": "jane@clinic.com", "role": "patient"},
//     {
//       "name": "Receptionist Alex",
//       "email": "alex@clinic.com",
//       "role": "receptionist",
//     },
//   ];

//   List<String> clinics = ["Clinic A", "Clinic B", "Clinic C", "Clinic D"];

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // Load clinic-doctor links when screen initializes
//   //   WidgetsBinding.instance.addPostFrameCallback((_) {
//   //     final clinicVM = Provider.of<ClinicViewModel>(context, listen: false);
//   //     clinicVM.fetchClinicDoctorLinks(context);
//   //   });
//   // }

//   Color getRoleColor(String role) {
//     switch (role.toLowerCase()) {
//       case 'doctor':
//         return Colors.blueAccent;
//       case 'patient':
//         return Colors.green;
//       case 'receptionist':
//         return Colors.orangeAccent;
//       default:
//         return Colors.grey;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF5F7FA),
//       appBar: AppBar(
//         title: Text(
//           'Users Management',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         elevation: 0,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black87,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.link, color: Colors.black54),
//             tooltip: 'View Clinic-Doctor Links',
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ClinicDoctorLinksScreen(),
//                 ),
//               );
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.search, color: Colors.black54),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView.builder(
//           itemCount: users.length,
//           itemBuilder: (context, index) {
//             final user = users[index];
//             return Card(
//               elevation: 3,
//               margin: EdgeInsets.symmetric(vertical: 8),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: ListTile(
//                 contentPadding: EdgeInsets.symmetric(
//                   horizontal: 20,
//                   vertical: 12,
//                 ),
//                 leading: CircleAvatar(
//                   radius: 24,
//                   backgroundColor: getRoleColor(user['role']!),
//                   child: Text(
//                     user['name']![0],
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 title: Text(
//                   user['name']!,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       user['email']!,
//                       style: TextStyle(color: Colors.grey[700]),
//                     ),
//                     SizedBox(height: 4),
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: getRoleColor(user['role']!).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Text(
//                         user['role']!.toUpperCase(),
//                         style: TextStyle(
//                           color: getRoleColor(user['role']!),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 trailing: Wrap(
//                   spacing: 4,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.edit, color: Colors.blueAccent),
//                       tooltip: 'Edit',
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => AddUserScreen(editUser: user),
//                           ),
//                         );
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.delete, color: Colors.redAccent),
//                       tooltip: 'Delete',
//                       onPressed: () {
//                         setState(() {
//                           users.removeAt(index);
//                         });
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.link, color: Colors.green),
//                       tooltip: 'Assign Clinics',
//                       onPressed: () {
//                         if (user['role'] == 'doctor') {
//                           showDialog(
//                             context: context,
//                             builder: (_) => LinkDoctorClinicsDialog(
//                               clinics: clinics,
//                               doctorName: user['name']!,
//                               doctorEmail: user['email']!,
//                             ),
//                           );
//                         } else if (user['role'] == 'patient') {
//                           showDialog(
//                             context: context,
//                             builder: (_) =>
//                                 LinkPatientClinicsDialog(clinics: clinics),
//                           );
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.blueAccent,
//         tooltip: 'Add User',
//         child: Icon(Icons.add, size: 28),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => AddUserScreen()),
//           );
//         },
//       ),
//     );
//   }
// }

// class AddUserScreen extends StatefulWidget {
//   final Map<String, String>? editUser;
//   AddUserScreen({this.editUser});

//   @override
//   _AddUserScreenState createState() => _AddUserScreenState();
// }

// class _AddUserScreenState extends State<AddUserScreen> {
//   final _formKey = GlobalKey<FormState>();

//   // Base fields
//   TextEditingController fullNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   // Role
//   String? selectedRole;

//   // Doctor fields
//   TextEditingController doctorCodeController = TextEditingController();
//   TextEditingController specializationController = TextEditingController();
//   TextEditingController licenseController = TextEditingController();
//   TextEditingController consultationFeeController = TextEditingController();
//   TextEditingController followUpFeeController = TextEditingController();
//   TextEditingController followUpDaysController = TextEditingController();
//   bool isMainDoctor = false;

//   // Patient fields
//   TextEditingController moIdController = TextEditingController();
//   TextEditingController medicalHistoryController = TextEditingController();
//   TextEditingController allergiesController = TextEditingController();
//   TextEditingController bloodGroupController = TextEditingController();

//   List<String> roles = [
//     'super_admin',
//     'organization_admin',
//     'clinic_admin',
//     'doctor',
//     'receptionist',
//     'pharmacist',
//     'lab_technician',
//     'billing_staff',
//     'patient',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     if (widget.editUser != null) {
//       fullNameController.text = widget.editUser!['name'] ?? '';
//       emailController.text = widget.editUser!['email'] ?? '';
//       selectedRole = widget.editUser!['role'];
//     }
//   }

//   InputDecoration inputDecoration(String label) => InputDecoration(
//     labelText: label,
//     filled: true,
//     fillColor: Colors.grey[100],
//     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF5F7FA),
//       appBar: AppBar(
//         title: Text(
//           widget.editUser == null ? 'Add New User' : 'Edit User',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black87,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Card(
//           elevation: 6,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           shadowColor: Colors.black12,
//           child: Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Section Header
//                   Text(
//                     "Basic Information",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   TextFormField(
//                     controller: fullNameController,
//                     decoration: inputDecoration('Full Name'),
//                     validator: (value) =>
//                         value == null || value.isEmpty ? 'Required' : null,
//                   ),
//                   SizedBox(height: 16),
//                   TextFormField(
//                     controller: emailController,
//                     decoration: inputDecoration('Email'),
//                     validator: (value) =>
//                         value == null || value.isEmpty ? 'Required' : null,
//                   ),
//                   SizedBox(height: 16),
//                   TextFormField(
//                     controller: phoneController,
//                     decoration: inputDecoration('Phone Number'),
//                     validator: (value) =>
//                         value == null || value.isEmpty ? 'Required' : null,
//                   ),
//                   SizedBox(height: 16),
//                   TextFormField(
//                     controller: passwordController,
//                     obscureText: true,
//                     decoration: inputDecoration('Password (optional)'),
//                   ),
//                   SizedBox(height: 16),
//                   DropdownButtonFormField<String>(
//                     value: selectedRole,
//                     decoration: inputDecoration('Select Role'),
//                     items: roles
//                         .map(
//                           (role) =>
//                               DropdownMenuItem(value: role, child: Text(role)),
//                         )
//                         .toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         selectedRole = value;
//                       });
//                     },
//                     validator: (value) =>
//                         value == null || value.isEmpty ? 'Required' : null,
//                   ),
//                   SizedBox(height: 24),

//                   // Doctor Fields
//                   if (selectedRole == 'doctor') ...[
//                     sectionCard("Doctor Details", doctorFields()),
//                   ],

//                   // Patient Fields
//                   if (selectedRole == 'patient') ...[
//                     sectionCard("Patient Details", patientFields()),
//                   ],

//                   SizedBox(height: 24),
//                   Center(
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 40,
//                           vertical: 16,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         backgroundColor: Colors.blueAccent,
//                       ),
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text('User Saved Successfully')),
//                           );
//                           Navigator.pop(context);
//                         }
//                       },
//                       child: Text(
//                         widget.editUser == null ? 'Add User' : 'Save Changes',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget sectionCard(String title, List<Widget> children) => Card(
//     elevation: 3,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//     margin: EdgeInsets.symmetric(vertical: 12),
//     child: Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.blueAccent,
//             ),
//           ),
//           SizedBox(height: 12),
//           ...children,
//         ],
//       ),
//     ),
//   );

//   List<Widget> doctorFields() => [
//     TextFormField(
//       controller: doctorCodeController,
//       decoration: inputDecoration('Doctor Code'),
//     ),
//     SizedBox(height: 12),
//     TextFormField(
//       controller: specializationController,
//       decoration: inputDecoration('Specialization'),
//     ),
//     SizedBox(height: 12),
//     TextFormField(
//       controller: licenseController,
//       decoration: inputDecoration('License Number'),
//     ),
//     SizedBox(height: 12),
//     TextFormField(
//       controller: consultationFeeController,
//       decoration: inputDecoration('Consultation Fee'),
//       keyboardType: TextInputType.number,
//     ),
//     SizedBox(height: 12),
//     TextFormField(
//       controller: followUpFeeController,
//       decoration: inputDecoration('Follow Up Fee'),
//       keyboardType: TextInputType.number,
//     ),
//     SizedBox(height: 12),
//     TextFormField(
//       controller: followUpDaysController,
//       decoration: inputDecoration('Follow Up Days'),
//       keyboardType: TextInputType.number,
//     ),
//     SizedBox(height: 12),
//     SwitchListTile(
//       title: Text('Is Main Doctor'),
//       value: isMainDoctor,
//       onChanged: (val) => setState(() => isMainDoctor = val),
//       activeColor: Colors.blueAccent,
//     ),
//   ];

//   List<Widget> patientFields() => [
//     TextFormField(
//       controller: moIdController,
//       decoration: inputDecoration('MO ID'),
//     ),
//     SizedBox(height: 12),
//     TextFormField(
//       controller: medicalHistoryController,
//       decoration: inputDecoration('Medical History'),
//       maxLines: 3,
//     ),
//     SizedBox(height: 12),
//     TextFormField(
//       controller: allergiesController,
//       decoration: inputDecoration('Allergies'),
//     ),
//     SizedBox(height: 12),
//     TextFormField(
//       controller: bloodGroupController,
//       decoration: inputDecoration('Blood Group'),
//     ),
//   ];
// }

// // ------------------ Link Management Popups ------------------
// class LinkDoctorClinicsDialog extends StatefulWidget {
//   final List<String> clinics;
//   final String doctorName;
//   final String doctorEmail;
//   LinkDoctorClinicsDialog({
//     required this.clinics,
//     required this.doctorName,
//     required this.doctorEmail,
//   });

//   @override
//   _LinkDoctorClinicsDialogState createState() =>
//       _LinkDoctorClinicsDialogState();
// }

// class _LinkDoctorClinicsDialogState extends State<LinkDoctorClinicsDialog> {
//   List<String> selectedClinics = [];
//   String searchQuery = '';

//   @override
//   Widget build(BuildContext context) {
//     List<String> filteredClinics = widget.clinics
//         .where((c) => c.toLowerCase().contains(searchQuery.toLowerCase()))
//         .toList();

//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 6,
//       backgroundColor: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: ConstrainedBox(
//           constraints: BoxConstraints(maxHeight: 400, minWidth: 300),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Assign Clinics to Doctor',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blueAccent,
//                 ),
//               ),
//               SizedBox(height: 12),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Search Clinics',
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[100],
//                 ),
//                 onChanged: (val) => setState(() => searchQuery = val),
//               ),
//               SizedBox(height: 12),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: filteredClinics.length,
//                   itemBuilder: (context, index) {
//                     final clinic = filteredClinics[index];
//                     return Card(
//                       elevation: 1,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       margin: EdgeInsets.symmetric(vertical: 4),
//                       child: CheckboxListTile(
//                         title: Text(clinic),
//                         value: selectedClinics.contains(clinic),
//                         onChanged: (val) {
//                           setState(() {
//                             if (val == true)
//                               selectedClinics.add(clinic);
//                             else
//                               selectedClinics.remove(clinic);
//                           });
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 12),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     child: Text(
//                       'Cancel',
//                       style: TextStyle(color: Colors.redAccent),
//                     ),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                   SizedBox(width: 12),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueAccent,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 20,
//                         vertical: 12,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: Text(
//                       'Save',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     onPressed: () async {
//                       if (selectedClinics.isNotEmpty) {
//                         await _createClinicDoctorLinks();
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Please select at least one clinic'),
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _createClinicDoctorLinks() async {
//     try {
//       final clinicVM = Provider.of<ClinicViewModel>(context, listen: false);

//       // Create links for each selected clinic
//       final links = selectedClinics.map((clinicName) {
//         return ClinicDoctorLinkModel(
//           clinic: ClinicInfo(
//             clinicCode: clinicName.replaceAll(' ', '_').toUpperCase(),
//             name: clinicName,
//           ),
//           doctor: DoctorInfo(
//             doctorCode: widget.doctorName.replaceAll(' ', '_').toUpperCase(),
//             email: widget.doctorEmail,
//             firstName: widget.doctorName.split(' ').first,
//             lastName: widget.doctorName.split(' ').length > 1
//                 ? widget.doctorName.split(' ').skip(1).join(' ')
//                 : '',
//             specialization: 'General Practitioner', // Default specialization
//             username: widget.doctorEmail.split('@').first,
//           ),
//         );
//       }).toList();

//       final createModel = CreateClinicDoctorLinkModel(links: links);

//       final success = await clinicVM.addClinicDoctorLinks(createModel, context);

//       if (success) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               'Successfully linked ${selectedClinics.length} clinic(s) to doctor',
//             ),
//             backgroundColor: Colors.green,
//           ),
//         );
//         Navigator.pop(context);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               'Failed to create clinic-doctor links: ${clinicVM.error}',
//             ),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error creating links: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
// }

// class LinkPatientClinicsDialog extends StatefulWidget {
//   final List<String> clinics;
//   LinkPatientClinicsDialog({required this.clinics});

//   @override
//   _LinkPatientClinicsDialogState createState() =>
//       _LinkPatientClinicsDialogState();
// }

// class _LinkPatientClinicsDialogState extends State<LinkPatientClinicsDialog> {
//   List<String> selectedClinics = [];
//   String searchQuery = '';

//   @override
//   Widget build(BuildContext context) {
//     List<String> filteredClinics = widget.clinics
//         .where((c) => c.toLowerCase().contains(searchQuery.toLowerCase()))
//         .toList();

//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 6,
//       backgroundColor: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: ConstrainedBox(
//           constraints: BoxConstraints(maxHeight: 400, minWidth: 300),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Assign Clinics to Patient',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green,
//                 ),
//               ),
//               SizedBox(height: 12),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Search Clinics',
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[100],
//                 ),
//                 onChanged: (val) => setState(() => searchQuery = val),
//               ),
//               SizedBox(height: 12),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: filteredClinics.length,
//                   itemBuilder: (context, index) {
//                     final clinic = filteredClinics[index];
//                     return Card(
//                       elevation: 1,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       margin: EdgeInsets.symmetric(vertical: 4),
//                       child: CheckboxListTile(
//                         title: Text(clinic),
//                         value: selectedClinics.contains(clinic),
//                         onChanged: (val) {
//                           setState(() {
//                             if (val == true)
//                               selectedClinics.add(clinic);
//                             else
//                               selectedClinics.remove(clinic);
//                           });
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 12),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     child: Text(
//                       'Cancel',
//                       style: TextStyle(color: Colors.redAccent),
//                     ),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                   SizedBox(width: 12),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 20,
//                         vertical: 12,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: Text(
//                       'Save',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     onPressed: () {
//                       print('Selected Clinics for Patient: $selectedClinics');
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
