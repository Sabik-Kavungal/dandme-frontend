import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:a/core/services/token_refresh_service.dart';
import 'package:a/core/config/app_router.dart';
import 'package:a/core/config/app_providers.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Initialize AuthViewModel and load tokens
  final authViewModel = AuthViewModel();
  await authViewModel.initialize();

  runApp(AeroServeApp(authViewModel: authViewModel));
}

class AeroServeApp extends StatelessWidget {
  final AuthViewModel authViewModel;

  const AeroServeApp({super.key, required this.authViewModel});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.getProviders(authViewModel: authViewModel),
      child: Consumer<AuthViewModel>(
        builder: (context, authVM, child) {
          return TokenRefreshManager(
            child: MaterialApp.router(
              title: 'AeroServe',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme: GoogleFonts.poppinsTextTheme(),
                scaffoldBackgroundColor: const Color(0xFFF8F8F8),
              ),
              routerConfig: AppRouter.router,
            ),
          );
        },
      ),
    );
  }
}
