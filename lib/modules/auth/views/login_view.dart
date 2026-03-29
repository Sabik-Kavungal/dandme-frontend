import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/core/config/navigation_helper.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController loginCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _keepMeSignedIn = false;

  // Validation functions
  String? _validateEmailOrPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email or phone is required';
    }

    final trimmedValue = value.trim();

    // Check if it's an email
    if (trimmedValue.contains('@')) {
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );
      if (!emailRegex.hasMatch(trimmedValue)) {
        return 'Please enter a valid email address';
      }
    } else {
      // Check if it's a phone number (basic validation)
      final phoneRegex = RegExp(r'^[+]?[\d\s\-\(\)]{10,}$');
      if (!phoneRegex.hasMatch(trimmedValue)) {
        return 'Please enter a valid phone number';
      }
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    final success = await authViewModel.login(
      loginCtrl.text.trim(),
      passCtrl.text.trim(),
      context,
    );

    if (!success) {
      // Show error dialog only if login fails
      if (mounted) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Login Failed"),
            content: const Text("Invalid email/phone or password."),
            actions: [
              TextButton(
                onPressed: () => NavigationHelper.goBack(ctx),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    } else {
      // Login was successful - show debug info
      print(
        '✅ Login successful! Authentication state should update automatically.',
      );
      print('Current isAuthenticated: ${authViewModel.isAuthenticated}');
      print('User role: ${authViewModel.userRole}');

      // Force navigation to appropriate dashboard using AuthViewModel method
      if (mounted) {
        final dashboardRoute = authViewModel.getDashboardRoute();
        print('Navigating to dashboard route: $dashboardRoute');

        // Navigate directly to the dashboard route
        context.go(dashboardRoute);
      }
    }
    // Navigation is handled automatically by main.dart based on authentication state
  }

  @override
  void dispose() {
    loginCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 920;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isDesktop
            ? _buildDesktopExperience(context, authViewModel)
            : _buildMobileExperience(context, authViewModel),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildRightPanel({required bool isCompact}) {
    final padding = isCompact
        ? const EdgeInsets.all(24)
        : const EdgeInsets.all(48);
    final borderRadius = BorderRadius.circular(isCompact ? 20 : 24);

    Widget analyticsCard({
      required String title,
      required String value,
      String? helper,
      double? width,
      double? minHeight,
    }) {
      return Container(
        width: width,
        padding: const EdgeInsets.all(16),
        constraints: BoxConstraints(minHeight: minHeight ?? 110),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF312E81).withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.indigo.shade400,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1E1B4B),
              ),
            ),
            if (helper != null) ...[
              const SizedBox(height: 8),
              Text(
                helper,
                style: const TextStyle(fontSize: 12, color: Color(0xFF6366F1)),
              ),
            ],
          ],
        ),
      );
    }

    Widget dashboardPreview(bool compact) {
      Widget transactionRow({
        required String customer,
        required String date,
        required String status,
        required Color statusColor,
        required String amount,
      }) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  customer,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111827),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  date,
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 13,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    status,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  amount,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111827),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(compact ? 20 : 28),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.94),
          borderRadius: BorderRadius.circular(compact ? 20 : 24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1F1B4D).withOpacity(0.12),
              blurRadius: 32,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 16,
                  runSpacing: 14,
                  children: [
                    analyticsCard(
                      title: 'Total Sales',
                      value: '\$189,374',
                      helper: 'This Month',
                      width: compact ? double.infinity : 180,
                      minHeight: 116,
                    ),
                    analyticsCard(
                      title: 'Total Profit',
                      value: '\$25,684',
                      helper: 'Net margin \$4,920',
                      width: compact ? double.infinity : 180,
                      minHeight: 116,
                    ),
                    analyticsCard(
                      title: 'Chat Performance',
                      value: '00:01:30',
                      helper: 'Avg. response time',
                      width: compact ? double.infinity : 180,
                      minHeight: 116,
                    ),
                    analyticsCard(
                      title: 'Sales Overview',
                      value: 'Weekly · Uptrend',
                      helper: '↑ 12% vs last week',
                      width: compact ? double.infinity : 200,
                      minHeight: 116,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(compact ? 18 : 22),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Transaction',
                        style: TextStyle(
                          fontSize: compact ? 15 : 16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF111827),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF4338CA).withOpacity(0.12),
                              const Color(0xFF6366F1).withOpacity(0.12),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: CustomPaint(painter: _LineChartPainter()),
                      ),
                      const SizedBox(height: 20),
                      transactionRow(
                        customer: 'Patricia Robinson',
                        date: '19 February, 2025',
                        status: 'Completed',
                        statusColor: const Color(0xFF10B981),
                        amount: '\$189',
                      ),
                      transactionRow(
                        customer: 'Andrew Hopkins',
                        date: '19 February, 2025',
                        status: 'Pending',
                        statusColor: const Color(0xFFF59E0B),
                        amount: '\$248',
                      ),
                      transactionRow(
                        customer: 'Angela Ruiz',
                        date: '18 February, 2025',
                        status: 'Processing',
                        statusColor: const Color(0xFF3B82F6),
                        amount: '\$410',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: compact ? 260 : 120,
              right: compact ? 12 : -12,
              child: Container(
                width: compact ? 160 : 200,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1F1B4D).withOpacity(0.18),
                      blurRadius: 40,
                      offset: const Offset(0, 18),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sales Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: compact ? 120 : 140,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const SweepGradient(
                                colors: [
                                  Color(0xFF6366F1),
                                  Color(0xFF8B5CF6),
                                  Color(0xFF4338CA),
                                  Color(0xFF6366F1),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: compact ? 72 : 84,
                            width: compact ? 72 : 84,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                '6,248',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color(0xFF111827),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Units',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Monthly',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6366F1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4338CA), Color(0xFF6366F1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        image: const DecorationImage(
          image: AssetImage('assets/neural-pattern-dark.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Color(0xFF312E81), BlendMode.softLight),
        ),
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          children: [
            Positioned(
              top: -80,
              right: -40,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(200),
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              right: 40,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(140),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Effortlessly manage your team\nand operations.',
                    style: TextStyle(
                      fontSize: isCompact ? 22 : 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Log in to access your CRM dashboard and manage your team.',
                    style: TextStyle(
                      fontSize: isCompact ? 13 : 15,
                      color: Colors.white.withOpacity(0.8),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: isCompact ? 24 : 32),
                  dashboardPreview(isCompact),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildInputLabel({required String label, required bool isCompact}) {
    return Text(
      label,
      style: TextStyle(
        fontSize: isCompact ? 13 : 14,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1F2937),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required FormFieldValidator<String> validator,
    TextInputType? textInputType,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: textInputType,
      style: const TextStyle(fontSize: 14, color: Color(0xFF1F2937)),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
        filled: true,
        fillColor: const Color(0xFFF3F4F6),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF6366F1), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDC2626)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDC2626), width: 1.5),
        ),
        errorStyle: const TextStyle(fontSize: 12),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildPasswordField() {
    return TextFormField(
      controller: passCtrl,
      obscureText: _obscurePassword,
      validator: _validatePassword,
      style: const TextStyle(fontSize: 14, color: Color(0xFF1F2937)),
      decoration: InputDecoration(
        hintText: 'Sellostore.',
        hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: const Color(0xFF6B7280),
            size: 20,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        filled: true,
        fillColor: const Color(0xFFF3F4F6),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF6366F1), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDC2626)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDC2626), width: 1.5),
        ),
        errorStyle: const TextStyle(fontSize: 12),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildSocialButton({
    required String label,
    required VoidCallback onPressed,
    required SocialButtonVariant variant,
  }) {
    Widget leadingIcon;
    switch (variant) {
      case SocialButtonVariant.google:
        leadingIcon = Container(
          height: 28,
          width: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE5E7EB)),
            color: Colors.white,
          ),
          child: const Center(
            child: Text(
              'G',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF4285F4),
              ),
            ),
          ),
        );
        break;
      case SocialButtonVariant.apple:
        leadingIcon = const Icon(Icons.apple, size: 24, color: Colors.black);
        break;
    }

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: const BorderSide(color: Color(0xFFE5E7EB)),
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            leadingIcon,
            const SizedBox(width: 12),
            Text(
              'Continue with $label',
              style: const TextStyle(
                fontSize: 13.2,
                color: Color(0xFF1F2937),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopExperience(
    BuildContext context,
    AuthViewModel authViewModel,
  ) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 980),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 48,
              offset: const Offset(0, 36),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 52),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: _buildFormSection(
                  context,
                  authViewModel,
                  isCompact: false,
                ),
              ),
              const SizedBox(width: 56),
              Expanded(flex: 5, child: _buildInfoSection(isCompact: false)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileExperience(
    BuildContext context,
    AuthViewModel authViewModel,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: [
          _buildFormSection(context, authViewModel, isCompact: true),
          const SizedBox(height: 36),
          _buildInfoSection(isCompact: true),
        ],
      ),
    );
  }

  Widget _buildFormSection(
    BuildContext context,
    AuthViewModel authViewModel, {
    required bool isCompact,
  }) {
    final labelStyle = TextStyle(
      fontSize: isCompact ? 12 : 13,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF0F172A),
    );

    InputDecoration decoration(String hint) {
      return InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 13.5),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDC2626)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDC2626), width: 1.5),
        ),
        errorStyle: const TextStyle(fontSize: 12),
      );
    }

    final formContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final canWrap = constraints.maxWidth < 420;
            final title = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Doctor&Me Unified Access',
                  style: TextStyle(
                    fontSize: isCompact ? 17 : 19,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'One login for super admins, doctors, care teams & patients',
                  style: TextStyle(
                    fontSize: isCompact ? 11 : 12,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ],
            );

            if (canWrap) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: isCompact ? 34 : 38,
                      width: isCompact ? 34 : 38,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.local_hospital_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  title,
                ],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 0,
                  child: Container(
                    height: isCompact ? 34 : 38,
                    width: isCompact ? 34 : 38,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.local_hospital_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 320),
                    child: title,
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 22),
        Text('Email', style: labelStyle),
        const SizedBox(height: 8),
        TextFormField(
          controller: loginCtrl,
          validator: _validateEmailOrPhone,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(fontSize: 14, color: Color(0xFF0F172A)),
          decoration: decoration('Enter your work email address'),
        ),
        const SizedBox(height: 16),
        Text('Password', style: labelStyle),
        const SizedBox(height: 8),
        TextFormField(
          controller: passCtrl,
          obscureText: _obscurePassword,
          validator: _validatePassword,
          style: const TextStyle(fontSize: 14, color: Color(0xFF0F172A)),
          decoration: decoration('Enter your password').copyWith(
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                size: 20,
                color: const Color(0xFF6B7280),
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                value: _keepMeSignedIn,
                onChanged: (value) {
                  setState(() {
                    _keepMeSignedIn = value ?? false;
                  });
                },
                activeColor: const Color(0xFF2563EB),
                side: const BorderSide(color: Color(0xFFD1D5DB), width: 1.5),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Keep me signed in on this device',
                style: TextStyle(
                  fontSize: isCompact ? 11.5 : 12.5,
                  color: const Color(0xFF4B5563),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        authViewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xFF2563EB),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Access Your Workspace',
                    style: TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
        const SizedBox(height: 18),
        _buildDividerLabel(isCompact: isCompact),
        const SizedBox(height: 18),
        _buildGoogleButton(),
      ],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final verticalPadding =
            constraints.maxHeight.isFinite && constraints.maxHeight < 620
            ? 12.0
            : 24.0;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          child: Form(key: _formKey, child: formContent),
        );
      },
    );
  }

  Widget _buildInfoSection({required bool isCompact}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: isCompact ? 34 : 40,
              width: isCompact ? 34 : 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF2563EB),
              ),
              child: const Icon(Icons.bolt, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Doctor&Me Platform',
                  style: TextStyle(
                    fontSize: isCompact ? 19 : 22,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF111827),
                  ),
                ),
                Text(
                  'Tailored workspace for patients, doctors & administrators',
                  style: TextStyle(
                    fontSize: isCompact ? 11.5 : 12.5,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Welcome to your smarter hospital workspace',
          style: TextStyle(
            fontSize: isCompact ? 17 : 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Coordinate in-patient rounds, outpatient clinics, diagnostics, and laboratory workflows from a single console designed for multidisciplinary hospital teams.',
          style: TextStyle(
            fontSize: isCompact ? 12.5 : 13.5,
            color: const Color(0xFF4B5563),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Bridge every department with real-time availability, instant updates, and guided workflows so each patient journey stays coordinated and on schedule.',
          style: TextStyle(
            fontSize: isCompact ? 12.5 : 13.5,
            color: const Color(0xFF4B5563),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 18),
        _buildFeatureRow(
          icon: Icons.screenshot_monitor_outlined,
          text:
              'Centralise rosters, theatre slots, ward rounds, and patient self-booking in one hub.',
          isCompact: isCompact,
        ),
        const SizedBox(height: 12),
        _buildFeatureRow(
          icon: Icons.people_alt_outlined,
          text:
              'Automate intake, triage, and follow-ups with role-aware approvals for super admins, doctors, nurses, and patients.',
          isCompact: isCompact,
        ),
        const SizedBox(height: 12),
        _buildFeatureRow(
          icon: Icons.monitor_heart_outlined,
          text:
              'Track vitals, lab reports, treatment plans, and feedback with alerts broadcast across every role.',
          isCompact: isCompact,
        ),
        const SizedBox(height: 20),
        Text(
          'We’re ready whenever your care teams are.',
          style: TextStyle(
            fontSize: isCompact ? 13 : 14.5,
            color: const Color(0xFF111827),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: isCompact ? 28 : 40),
        Text(
          'By inserting your email you confirm you agree to Doctor&Me contacting you about hospital-grade solutions and services. You can opt out at any time by clicking unsubscribe.',
          style: TextStyle(
            fontSize: isCompact ? 10.5 : 11.5,
            color: const Color(0xFF9CA3AF),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            // Navigate to privacy policy
          },
          child: Text(
            'Find out how we use data in our privacy policy.',
            style: TextStyle(
              fontSize: isCompact ? 10.5 : 11.5,
              color: const Color(0xFF2563EB),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureRow({
    required IconData icon,
    required String text,
    required bool isCompact,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 26,
          width: 26,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE0E7FF),
          ),
          child: Icon(icon, size: 16, color: const Color(0xFF2563EB)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: isCompact ? 12 : 12.5,
              color: const Color(0xFF4B5563),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDividerLabel({required bool isCompact}) {
    return Row(
      children: [
        Expanded(child: Container(height: 1, color: const Color(0xFFE5E7EB))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'or continue with',
            style: TextStyle(
              fontSize: isCompact ? 11 : 12,
              letterSpacing: 0.4,
              color: const Color(0xFF9CA3AF),
            ),
          ),
        ),
        Expanded(child: Container(height: 1, color: const Color(0xFFE5E7EB))),
      ],
    );
  }

  Widget _buildGoogleButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          // Handle Google login
        },
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: const BorderSide(color: Color(0xFFE5E7EB)),
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              'https://www.google.com/favicon.ico',
              height: 20,
              width: 20,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.g_mobiledata,
                size: 24,
                color: Color(0xFF4285F4),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Continue with Google Workspace',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF111827),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum SocialButtonVariant { google, apple }

class _LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = const Color(0xFFDDE3FF)
      ..strokeWidth = 1;

    const horizontalLines = 4;
    for (var i = 1; i < horizontalLines; i++) {
      final dy = size.height * (i / horizontalLines);
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), gridPaint);
    }

    final linePaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height * 0.75);
    path.cubicTo(
      size.width * 0.2,
      size.height * 0.4,
      size.width * 0.4,
      size.height * 0.9,
      size.width * 0.6,
      size.height * 0.35,
    );
    path.cubicTo(
      size.width * 0.75,
      size.height * 0.15,
      size.width * 0.85,
      size.height * 0.65,
      size.width,
      size.height * 0.25,
    );

    canvas.drawPath(path, linePaint);

    final fillPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0x806366F1), Color(0x008B5CF6)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(fillPath, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
