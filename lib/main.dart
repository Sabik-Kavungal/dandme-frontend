import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
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

class AeroServeApp extends StatefulWidget {
  final AuthViewModel authViewModel;

  const AeroServeApp({super.key, required this.authViewModel});

  @override
  State<AeroServeApp> createState() => _AeroServeAppState();
}

class _AeroServeAppState extends State<AeroServeApp> {
  late List<SingleChildWidget> _providers;

  @override
  void initState() {
    super.initState();
    // Initialize providers based on current user role
    _providers = AppProviders.getProvidersForCurrentUser(
      authViewModel: widget.authViewModel,
      lazy: true,
    );

    // Listen for user changes to reload providers
    widget.authViewModel.addListener(_onAuthChanged);
  }

  @override
  void dispose() {
    widget.authViewModel.removeListener(_onAuthChanged);
    super.dispose();
  }

  /// Called when auth state changes (login/logout)
  void _onAuthChanged() {
    // Reload providers when user role changes
    final newProviders = AppProviders.getProvidersForCurrentUser(
      authViewModel: widget.authViewModel,
      lazy: true,
    );

    // Only update if providers actually changed
    if (_providersChanged(newProviders)) {
      setState(() {
        _providers = newProviders;
      });
      print(
        '🔄 Providers reloaded for role: ${widget.authViewModel.user?.role}',
      );
    }
  }

  /// Check if providers list has changed
  bool _providersChanged(List<SingleChildWidget> newProviders) {
    if (_providers.length != newProviders.length) return true;
    // In practice, we consider providers changed if count is different
    // Could add more sophisticated comparison if needed
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers,
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
