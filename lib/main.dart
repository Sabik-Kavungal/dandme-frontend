import 'package:a/screens/auth/login.dart';
import 'package:a/widgets/role_based_layout.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:a/viewModels/authVM.dart';
import 'package:a/viewModels/organization_vm.dart';
import 'package:a/viewModels/clinic_vm.dart';
import 'package:a/viewModels/doctor_vm.dart';
import 'package:a/services/token_refresh_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Initialize AuthVM and load tokens
  final authVM = AuthViewModel();
  await authVM.initialize();

  runApp(AeroServeApp(authVM: authVM));
}

class AeroServeApp extends StatelessWidget {
  final AuthViewModel authVM;

  const AeroServeApp({super.key, required this.authVM});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>.value(value: authVM),
        ChangeNotifierProvider<OrganizationViewModel>(
          create: (context) => OrganizationViewModel(),
        ),
        ChangeNotifierProvider<ClinicViewModel>(
          create: (context) => ClinicViewModel(),
        ),
        ChangeNotifierProvider<DoctorViewModel>(
          create: (context) => DoctorViewModel(),
        ),
      ],
      child: Consumer<AuthViewModel>(
        builder: (context, authVM, child) {
          return TokenRefreshManager(
            child: MaterialApp(
              title: 'AeroServe',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme: GoogleFonts.poppinsTextTheme(),
                scaffoldBackgroundColor: const Color(0xFFF8F8F8),
              ),
              // 👉 If authenticated → RoleBasedLayout, else Login
              home: authVM.isAuthenticated
                  ? const RoleBasedLayout()
                  : LoginScreen(),
            ),
          );
        },
      ),
    );
  }
}
