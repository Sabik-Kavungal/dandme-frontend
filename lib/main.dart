import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/core/services/token_refresh_service.dart';
import 'package:drandme/core/config/app_router.dart';
import 'package:drandme/core/config/app_providers.dart';
import 'package:drandme/core/widgets/app_loader.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Remove # from URL
  usePathUrlStrategy();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // Set system UI overlay style for a premium look
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // Initialize Hive
  await Hive.initFlutter();

  // Initialize AuthViewModel and load tokens
  final authViewModel = AuthViewModel();
  await authViewModel.initialize();

  runApp(DoctorAndMeApp(authViewModel: authViewModel));
}

class DoctorAndMeApp extends StatefulWidget {
  final AuthViewModel authViewModel;

  const DoctorAndMeApp({super.key, required this.authViewModel});

  @override
  State<DoctorAndMeApp> createState() => _DoctorAndMeAppState();
}

class _DoctorAndMeAppState extends State<DoctorAndMeApp> {
  late List<SingleChildWidget> _providers;
  String? _lastRole;

  @override
  void initState() {
    super.initState();
    _lastRole = widget.authViewModel.user?.role;
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
    final currentRole = widget.authViewModel.user?.role;

    // Only reload providers if the role has actually changed
    if (currentRole != _lastRole) {
      final newProviders = AppProviders.getProvidersForCurrentUser(
        authViewModel: widget.authViewModel,
        lazy: true,
      );

      setState(() {
        _providers = newProviders;
        _lastRole = currentRole;
      });

      print('🔄 Providers reloaded for role: $currentRole');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers,
      child: Consumer<AuthViewModel>(
        builder: (context, authVM, child) {
          return TokenRefreshManager(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(
                physics: const BouncingScrollPhysics(),
                scrollbars: true,
              ),
              child: MaterialApp.router(
                title: 'Doctor & Me',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  useMaterial3: true,
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color(
                      0xFF0F766E,
                    ), // Teal 700 - Medical Theme
                    primary: const Color(0xFF0F766E),
                    secondary: const Color(0xFF1E293B), // Slate 900
                    surface: Colors.white,
                    background: const Color(0xFFF8FAFC), // Slate 50
                  ),
                  textTheme: GoogleFonts.outfitTextTheme(
                    Theme.of(context).textTheme,
                  ),
                  scaffoldBackgroundColor: const Color(0xFFF8FAFC),
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    centerTitle: false,
                    surfaceTintColor: Colors.transparent,
                  ),
                ),
                routerConfig: AppRouter.router,
                builder: (context, child) {
                  return GlobalLoadingOverlay(child: child!);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
