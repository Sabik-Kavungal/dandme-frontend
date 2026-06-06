import 'package:flutter/material.dart';
import 'dart:ui'; // Required for ImageFilter
import 'dart:async'; // Required for Timer
import 'package:google_fonts/google_fonts.dart';

import 'package:drandme/core/config/navigation_helper.dart';

/// Full-screen intro page with 5 sections matching the uploaded designs
class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController();
  // Use lazy initialization pattern to safely handle hot reloads where state persists
  ScrollController? _internalSolutionsController;
  ScrollController get _solutionsController =>
      _internalSolutionsController ??= ScrollController();

  int _activeIndex = 0;
  bool _isAutoScrolling = false;

  // Hero Image Slider State
  int _heroIndex = 0;
  Timer? _heroTimer;
  final List<String> _heroImages = [
    'assets/vr-person.png',
    'assets/sssssvr.png',
  ];

  // Scroll Keys
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _productKey = GlobalKey();
  final GlobalKey _pricingKey = GlobalKey(); // Maps to Section 5
  final GlobalKey _contactKey = GlobalKey(); // Maps to Section 2
  final GlobalKey _trialKey = GlobalKey(); // Maps to Section 1

  // Color constants matching the designs
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFFF3B30);
  static const Color white = Color(0xFFFFFFFF);
  static const Color mediumGray = Color(0xFF666666);
  static const Color darkGray = Color(0xFF222222);
  static const Color lightRedBorder = Color(0xFFFFDDDD);
  static const Color pinkAccent = Color(0xFFFF6699);

  @override
  void initState() {
    super.initState();
    // Preload hero images to ensure crisp, instant render
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(
        const AssetImage('assets/neural-pattern-dark.png'),
        context,
      );
      precacheImage(const AssetImage('assets/pattern-right.png'), context);
      for (var img in _heroImages) {
        precacheImage(AssetImage(img), context);
      }
    });

    // Start Auto-sliding for Hero Header
    _startHeroTimer();
  }

  void _startHeroTimer() {
    _heroTimer?.cancel();
    _heroTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          _heroIndex = (_heroIndex + 1) % _heroImages.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _heroTimer?.cancel();
    _internalSolutionsController?.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification is ScrollUpdateNotification) {
                _updateActiveTab();
              }
              return false;
            },
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  RepaintBoundary(
                    child: KeyedSubtree(
                      key: _homeKey,
                      child: _buildSection3(
                        screenHeight,
                        screenWidth,
                        isMobile,
                      ),
                    ),
                  ),
                  RepaintBoundary(
                    child: KeyedSubtree(
                      key: _productKey,
                      child: _buildSection4(
                        screenHeight,
                        screenWidth,
                        isMobile,
                      ),
                    ),
                  ),
                  RepaintBoundary(
                    child: KeyedSubtree(
                      key: _pricingKey,
                      child: _buildSection5(
                        screenHeight,
                        screenWidth,
                        isMobile,
                      ),
                    ),
                  ),
                  RepaintBoundary(
                    child: KeyedSubtree(
                      key: _contactKey,
                      child: _buildSection2(
                        screenHeight,
                        screenWidth,
                        isMobile,
                      ),
                    ),
                  ),
                  RepaintBoundary(
                    child: KeyedSubtree(
                      key: _trialKey,
                      child: _buildSection1(
                        screenHeight,
                        screenWidth,
                        isMobile,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: RepaintBoundary(
              child: _buildFullNavigationBar(screenWidth, isMobile),
            ),
          ),
        ],
      ),
    );
  }

  // ... (All the existing section builders will go here)
  // I need to keep the original section 1, 2, 4, 5 intact and just update section 3

  Widget _buildSection1(double height, double width, bool isMobile) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          // Top CTA section (60% of height)
          Expanded(
            flex: 60,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: black,
                image: DecorationImage(
                  image: AssetImage('assets/1seeee.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  filterQuality: FilterQuality.medium,
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80,
                vertical: isMobile ? 30 : 40,
              ),
              child: Stack(
                children: [
                  // Content
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Refined Live Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: white.withOpacity(0.2)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFF4CAF50),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x804CAF50),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'HEALTHCARE TECHNOLOGY SUITE',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w900,
                                color: white,
                                letterSpacing: 2.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),

                      // Impact Heading
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: isMobile ? 36 : 64,
                            fontWeight: FontWeight.w800,
                            color: white,
                            height: 1.1,
                            letterSpacing: -1.5,
                            shadows: [
                              Shadow(
                                color: black.withOpacity(0.3),
                                offset: const Offset(0, 4),
                                blurRadius: 15,
                              ),
                            ],
                          ),
                          children: [
                            const TextSpan(text: 'The Gold Standard of\n'),
                            TextSpan(
                              text: 'Healthcare Innovation',
                              style: TextStyle(
                                color: red,
                                fontWeight: FontWeight.w900,
                                shadows: [
                                  Shadow(
                                    color: red.withOpacity(0.4),
                                    offset: const Offset(0, 6),
                                    blurRadius: 20,
                                  ),
                                ],
                              ),
                            ),
                            const TextSpan(text: '.'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Premium Structural Accent
                      Container(
                        width: 140,
                        height: 6,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [white, white.withOpacity(0.3)],
                          ),
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: [
                            BoxShadow(
                              color: white.withOpacity(0.2),
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bottom red footer section (40% of height)
          Expanded(
            flex: 40,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    red,
                    const Color(0xFFD32F2F), // Slightly deeper classic red
                  ],
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80,
                vertical: isMobile ? 20 : 30,
              ),
              child: isMobile
                  ? SingleChildScrollView(child: _buildMobileFooter())
                  : _buildDesktopFooter(width),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Premium Footer Logo
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/appbartextdr&me.png', height: 28, color: white),
            const SizedBox(width: 8),
            Container(width: 1, height: 20, color: white.withOpacity(0.3)),
            const SizedBox(width: 8),
            Text(
              'HEALTHCARE',
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: white,
                letterSpacing: 2.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),

        // App Store Buttons with Glass Effect
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildPremiumAppButton(Icons.apple, 'Download on the', 'App Store'),
            _buildPremiumAppButton(
              Icons.play_arrow_rounded,
              'GET IT ON',
              'Google Play',
            ),
          ],
        ),
        const SizedBox(height: 48),

        // Footer Links
        _buildFooterLinksMobile(),
        const SizedBox(height: 48),

        // Separator
        Container(
          height: 1,
          width: double.infinity,
          color: white.withOpacity(0.1),
        ),
        const SizedBox(height: 24),

        // Copyright and Social
        _buildCopyrightAndSocial(isMobile: true),
      ],
    );
  }

  Widget _buildDesktopFooter(double width) {
    return Column(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Brand Presence Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/appbartextdr&me.png',
                    height: 42,
                    color: white,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'HEALTHCARE TECHNOLOGY SUITE',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: white.withOpacity(0.7),
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      _buildPremiumAppButton(
                        Icons.apple,
                        'Download on the',
                        'App Store',
                      ),
                      const SizedBox(width: 12),
                      _buildPremiumAppButton(
                        Icons.play_arrow_rounded,
                        'GET IT ON',
                        'Google Play',
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              // Links Grid
              Expanded(flex: 3, child: _buildFooterLinksDesktop()),
            ],
          ),
        ),

        // Bottom Bar
        Container(
          height: 1,
          width: double.infinity,
          color: white.withOpacity(0.1),
          margin: const EdgeInsets.only(bottom: 24),
        ),
        _buildCopyrightAndSocial(isMobile: false),
      ],
    );
  }

  Widget _buildPremiumAppButton(
    IconData icon,
    String topText,
    String bottomText,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: white.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: white, size: 28),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                topText.toUpperCase(),
                style: GoogleFonts.inter(
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  color: white.withOpacity(0.7),
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                bottomText,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLinksMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFooterLinkColumn('Company Info', ['About Us']),
        const SizedBox(height: 20),
        _buildFooterLinkColumn('Legal', [
          'Privacy Policy',
          'Terms & Conditions',
          'Disclaimer',
        ]),
        const SizedBox(height: 20),
        _buildFooterLinkColumn('Features', [
          'Business Marketing',
          'User Analytic',
          'Live Chat',
          'Unlimited Support',
        ]),
      ],
    );
  }

  Widget _buildFooterLinksDesktop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildFooterLinkColumn('Company Info', ['About Us'])),
        Expanded(
          child: _buildFooterLinkColumn('Legal', [
            'Privacy Policy',
            'Terms & Conditions',
            'Disclaimer',
          ]),
        ),
        Expanded(
          child: _buildFooterLinkColumn('Features', [
            'Business Marketing',
            'User Analytic',
            'Live Chat',
            'Unlimited Support',
          ]),
        ),
      ],
    );
  }

  Widget _buildFooterLinkColumn(String title, List<String> links) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              color: white,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 24),
          ...links.map(
            (link) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () {
                  if (link == 'About Us') {
                    _scrollTo(_homeKey, 0);
                  } else if (link == 'Privacy Policy') {
                    _showPrivacyPolicyDialog();
                  } else if (link == 'Terms & Conditions') {
                    _showTermsConditionsDialog();
                  } else if (link == 'Disclaimer') {
                    _showDisclaimerDialog();
                  }
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    link,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: white.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCopyrightAndSocial({required bool isMobile}) {
    final copyright = Text(
      '© ${DateTime.now().year} DOCTOR AND ME. All rights reserved.',
      style: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: white.withOpacity(0.6),
      ),
    );

    final socialIcons = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSocialIcon(Icons.facebook),
        const SizedBox(width: 12),
        _buildSocialIcon(Icons.camera_alt),
        const SizedBox(width: 12),
        _buildSocialIcon(Icons.alternate_email),
      ],
    );

    if (isMobile) {
      return Column(
        children: [socialIcons, const SizedBox(height: 16), copyright],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [copyright, socialIcons],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: white.withOpacity(0.05),
        shape: BoxShape.circle,
        border: Border.all(color: white.withOpacity(0.1)),
      ),
      child: Center(child: Icon(icon, color: white, size: 20)),
    );
  }

  // Section 4: Connect With Us contact page
  Widget _buildSection2(double height, double width, bool isMobile) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: white,
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.5,
          colors: [
            white,
            Color(0xFFFBFBFC), // Premium subtle off-white for depth
          ],
        ),
      ),
      child: Stack(
        children: [
          // Premium Decorative Accents (Background)
          Positioned(
            left: -40,
            top: 100,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: red.withOpacity(0.04), width: 1),
              ),
            ),
          ),
          Positioned(
            right: -60,
            bottom: 150,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: red.withOpacity(0.06), width: 1.5),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: isMobile ? 40 : 60,
            ),
            child: isMobile
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSection2LeftContent(isMobile),
                        const SizedBox(height: 48),
                        _buildSection2ContactForm(width, isMobile),
                      ],
                    ),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                          child: _buildSection2LeftContent(isMobile),
                        ),
                      ),
                      const SizedBox(width: 80), // Increased spacing
                      Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                          child: _buildSection2ContactForm(width, isMobile),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection2LeftContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Premium Badge / Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: red.withOpacity(0.15)),
            boxShadow: [
              BoxShadow(
                color: red.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF4CAF50),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'CONNECT WITH US',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: red,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        RichText(
          text: TextSpan(
            style: GoogleFonts.outfit(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: darkGray,
              height: 1.1,
              letterSpacing: -0.5,
            ),
            children: const [
              TextSpan(text: 'Let\'s revolutionize healthcare '),
              TextSpan(
                text: 'together!',
                style: TextStyle(color: red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        Text(
          'We\'d love to hear from you. Whether you\'re a hospital, clinic, or healthcare provider looking to simplify operations and enhance patient care, our team is ready to help you get started.',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 15 : 18,
            color: mediumGray,
            height: 1.6,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 32),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: red,
                borderRadius: BorderRadius.circular(50), // Circular check
              ),
              child: const Icon(Icons.check, color: white, size: 14),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'One-Stop Hospital Solution - Connect doctors, patients, labs, and pharmacy in one platform.',
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 14 : 16,
                  color: darkGray,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        const Divider(color: Color(0xFFEEEEEE), thickness: 1), // Softer divider
        const SizedBox(height: 40),

        isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildContactInfo(),
                  const SizedBox(height: 24),
                  _buildVisitOffice(),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildContactInfo()),
                  const SizedBox(width: 40),
                  Expanded(child: _buildVisitOffice()),
                ],
              ),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: red.withOpacity(0.06),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.info_outline_rounded,
                color: red.withOpacity(0.6),
                size: 16,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Contact Info',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: mediumGray,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Icon(
              Icons.chat_bubble_outline_rounded,
              color: Color(0xFF25D366),
              size: 22,
            ),
            const SizedBox(width: 12),
            Text(
              '+91-7025212520',
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: darkGray,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 34),
          child: Text(
            'contactus@doctorandmeonline.com',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: darkGray.withOpacity(0.8),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVisitOffice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: red.withOpacity(0.06),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.location_on_outlined,
                color: red.withOpacity(0.6),
                size: 16,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Visit Our Office',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: mediumGray,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 34),
          child: Text(
            '6/465 Mundukkadan Tower, Kottakkal - 676503,\nMalappuram Dist, Kerala, India',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: darkGray.withOpacity(0.8),
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSection2ContactForm(double width, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF0F0F0), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Connect with us!',
            style: GoogleFonts.outfit(
              fontSize: isMobile ? 24 : 28,
              fontWeight: FontWeight.bold,
              color: darkGray,
            ),
          ),
          const SizedBox(height: 40),
          _buildFormField('Name *'),
          const SizedBox(height: 24),
          _buildFormField('Email Address *'),
          const SizedBox(height: 24),
          _buildFormField('Phone Number *'),
          const SizedBox(height: 24),
          _buildDropdownField('Service you are interested in *'),
          const SizedBox(height: 24),
          _buildTextAreaField('How can we help you?'),
          const SizedBox(height: 40),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: const LinearGradient(
                colors: [Color(0xFFFF3B30), Color(0xFFFF6B6B)],
              ),
              boxShadow: [
                BoxShadow(
                  color: red.withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 18,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Send a Message',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          placeholder,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: darkGray.withOpacity(0.4),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Container(height: 1, color: const Color(0xFFCCCCCC)),
      ],
    );
  }

  Widget _buildDropdownField(String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              placeholder,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: darkGray.withOpacity(0.4),
                fontWeight: FontWeight.w400,
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: mediumGray),
          ],
        ),
        const SizedBox(height: 8),
        Container(height: 1, color: const Color(0xFFCCCCCC)),
      ],
    );
  }

  Widget _buildTextAreaField(String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          placeholder,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: darkGray.withOpacity(0.4),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 16),
        Container(height: 1, color: const Color(0xFFCCCCCC)),
      ],
    );
  }

  // Section 1: Split-screen hero section
  Widget _buildSection3(double height, double width, bool isMobile) {
    return Container(
      height: height,
      width: width,
      // Use a subtle gradient background for the whole section for depth
      decoration: const BoxDecoration(color: black),
      child: Stack(
        children: [
          // Neural Pattern Background
          Positioned.fill(
            child: Opacity(
              opacity: 0.1, // Subtle texture
              child: Image.asset(
                'assets/neural-pattern-dark.png',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.low,
              ),
            ),
          ),

          // Background decorative glow (Left side) - Optimized for Web
          Positioned(
            left: -100,
            top: -100,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [red.withOpacity(0.15), Colors.transparent],
                  stops: const [0.0, 0.7],
                ),
              ),
            ),
          ),

          Flex(
            direction: isMobile && height > 800
                ? Axis.vertical
                : Axis.horizontal,
            children: [
              // Left Content (60%)
              Expanded(
                flex: isMobile && height > 800 ? 5 : 6,
                child: _buildSection3LeftSide(height, width, isMobile),
              ),
              // Right Image (40%) - Hidden on mobile for space if needed, or shown
              if (!isMobile || (isMobile && height > 800))
                Expanded(
                  flex: isMobile && height > 800 ? 5 : 4,
                  child: _buildSection3RightSide(height, width, isMobile),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection3LeftSide(double height, double width, bool isMobile) {
    return Container(
      color:
          Colors.transparent, // Background handled by parent for cleaner blend
      margin: const EdgeInsets.only(top: 80), // Push below navbar
      padding: EdgeInsets.symmetric(
        horizontal: isMobile || width < 1200 ? 32 : 100, // More breathing room
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Badge / Pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: white.withOpacity(0.2)),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: red,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Modern Healthcare Platform',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: white.withOpacity(0.9),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Hero Title with classic typography
          RichText(
            text: TextSpan(
              style: GoogleFonts.outfit(
                fontSize: isMobile ? 32 : 59.6,
                fontWeight: FontWeight.bold,
                color: white,
                height: 1.15,
                letterSpacing: -1.0,
                shadows: [
                  Shadow(
                    color: black.withOpacity(0.5),
                    offset: const Offset(0, 4),
                    blurRadius: 15,
                  ),
                ],
              ),
              children: [
                const TextSpan(
                  text: 'Simplifying Healthcare Management for,\n',
                ),
                TextSpan(
                  text: 'Everyone.',
                  style: TextStyle(
                    color: red,
                    shadows: [
                      Shadow(
                        color: red.withOpacity(0.3),
                        offset: const Offset(0, 8),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Subtitle
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Text(
              'Dr & Me provides a comprehensive ecosystem connecting Clinics, Patients, Labs, and Pharmacies seamlessly. Experience the future of medical practice management.',
              style: GoogleFonts.inter(
                fontSize: isMobile ? 16 : 18,
                color: const Color(0xFFAAAAAA), // Softer grey
                height: 1.6,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // const SizedBox(height: 48),

          // // Premium CTA Button
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(50),
          //     gradient: const LinearGradient(
          //       colors: [Color(0xFFFF3B30), Color(0xFFFF6B6B)],
          //     ),
          //     boxShadow: [
          //       BoxShadow(
          //         color: red.withOpacity(0.4),
          //         blurRadius: 20,
          //         offset: const Offset(0, 8),
          //       ),
          //     ],
          //   ),
          //   child: Material(
          //     color: Colors.transparent,
          //     child: InkWell(
          //       borderRadius: BorderRadius.circular(50),
          //       onTap: () {},
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 36,
          //           vertical: 18,
          //         ),
          //         child: Row(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Text(
          //               'Book a Demo',
          //               style: GoogleFonts.inter(
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.w600,
          //                 color: white,
          //               ),
          //             ),
          //             const SizedBox(width: 12),
          //             const Icon(
          //               Icons.arrow_forward_rounded,
          //               color: white,
          //               size: 20,
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildSection3RightSide(double height, double width, bool isMobile) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final localHeight = constraints.maxHeight;
        final localWidth = constraints.maxWidth;

        // 🔹 Desktop-only VR height scaling
        double vrHeightFactor;
        if (isMobile) {
          vrHeightFactor = 0.55;
        } else if (width >= 1200) {
          vrHeightFactor = 0.9; // large desktop
        } else if (width >= 992) {
          vrHeightFactor = 0.8; // medium desktop
        } else {
          vrHeightFactor = 0.7; // small desktop
        }

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(child: Container(color: white)),

            Positioned.fill(
              child: Image.asset(
                'assets/pattern-right.png',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                opacity: const AlwaysStoppedAnimation(0.3),
              ),
            ),

            // ✅ VR IMAGE SLIDER with Animated Transition
            Positioned(
              right: isMobile ? -50 : -80,
              bottom: 0,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                switchInCurve: Curves.easeOutCubic,
                switchOutCurve: Curves.easeInCubic,
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  );
                },
                child: Container(
                  key: ValueKey<int>(_heroIndex),
                  height: height * vrHeightFactor,
                  child:
                      (_heroImages[_heroIndex].contains('vr-person') ||
                          _heroImages[_heroIndex].contains('sssssvr'))
                      ? Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.identity()..rotateY(3.14159),
                          child: Image.asset(
                            _heroImages[_heroIndex],
                            fit: BoxFit.fitHeight,
                            filterQuality: FilterQuality.high,
                          ),
                        )
                      : Image.asset(
                          _heroImages[_heroIndex],
                          fit: BoxFit.fitHeight,
                          filterQuality: FilterQuality.high,
                        ),
                ),
              ),
            ),

            // Pagination Dots
            if (!isMobile)
              Positioned(
                bottom: 40,
                left: 40,
                child: Row(
                  children: List.generate(
                    _heroImages.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _heroIndex = index;
                            _startHeroTimer(); // Reset timer on manual click
                          });
                        },
                        child: _buildHeroPaginationDot(
                          active: _heroIndex == index,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildHeroPaginationDot({required bool active}) {
    return Container(
      width: active ? 10 : 8,
      height: active ? 10 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? red : const Color(0xFFDDDDDD),
      ),
    );
  }

  Widget _buildFullNavigationBar(double width, bool isMobile) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile || width < 1200 ? 24 : 80,
        vertical: 20, // A balanced classic height
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            black.withOpacity(0.9), // Deep rich black at the top
            black.withOpacity(0.5),
            Colors.transparent,
          ],
          stops: const [0.0, 0.6, 1.0],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Premium Logo Area
          InkWell(
            onTap: () => _scrollTo(_homeKey, 0),
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/appbartextdr&me.png',
                  height: 26.5,

                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 2),
                Text(
                  'HEALTHCARE TECHNOLOGY SUITE',
                  style: GoogleFonts.inter(
                    fontSize: 7.2, // Slightly adjusted for longer text
                    fontWeight: FontWeight.w800,
                    color: white.withOpacity(0.5),
                    letterSpacing:
                        1.8, // Slightly reduced spacing for longer title
                  ),
                ),
              ],
            ),
          ),

          // Desktop Actions
          if (!isMobile)
            Row(
              children: [
                _IntroNavLink(
                  text: 'Home',
                  active: _activeIndex == 0,
                  onTap: () => _scrollTo(_homeKey, 0),
                ),
                _IntroNavLink(
                  text: 'Product',
                  active: _activeIndex == 1,
                  onTap: () => _scrollTo(_productKey, 1),
                ),
                const SizedBox(width: 16),

                // Glass Login Button
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: TextButton(
                    onPressed: () => NavigationHelper.goToLogin(context),
                    style: TextButton.styleFrom(
                      foregroundColor: white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: white.withOpacity(0.15)),
                      ),
                      backgroundColor: white.withOpacity(0.05),
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // Classic Premium CTA
                Hero(
                  tag: 'cta_button',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF3B30), Color(0xFFFF6B6B)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: red.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _scrollTo(_contactKey, 3),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Get Started',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: white,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                color: white,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          // Mobile Menu Indicator
          if (isMobile)
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _showMobileMenu(context),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: white.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.menu_rounded, color: white, size: 28),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dr&Me',
                    style: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: red,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close_rounded, color: darkGray),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              _mobileNavItem(
                'Home',
                active: _activeIndex == 0,
                onTap: () {
                  Navigator.pop(context);
                  _scrollTo(_homeKey, 0);
                },
              ),
              _mobileNavItem(
                'Product',
                active: _activeIndex == 1,
                onTap: () {
                  Navigator.pop(context);
                  _scrollTo(_productKey, 1);
                },
              ),
              const Spacer(),
              _mobileNavItem(
                'Login',
                onTap: () {
                  // Close the bottom sheet first
                  Navigator.pop(context);
                  NavigationHelper.goToLogin(context);
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: Material(
                  color: red,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollTo(_contactKey, 3);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.inter(
                            color: white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _mobileNavItem(
    String text, {
    bool active = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: active ? FontWeight.w600 : FontWeight.w400,
            color: darkGray,
          ),
        ),
      ),
    );
  }

  // Legacy _navItem removed in favor of _IntroNavLink widget below

  void _scrollTo(GlobalKey? key, int index) {
    if (key == null || key.currentContext == null) {
      debugPrint(
        "Navigation Error: Target section not found. Please Hot Restart.",
      );
      return;
    }
    setState(() {
      _activeIndex = index;
      _isAutoScrolling = true;
    });
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    ).then((_) {
      if (mounted) {
        setState(() {
          _isAutoScrolling = false;
        });
      }
    });
  }

  void _updateActiveTab() {
    if (_isAutoScrolling) return;

    final keys = [_homeKey, _productKey, _pricingKey, _contactKey, _trialKey];
    for (int i = keys.length - 1; i >= 0; i--) {
      final keyContext = keys[i].currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox?;
        if (box != null && box.hasSize) {
          final position = box.localToGlobal(Offset.zero);
          // If the top of the section is near the top of the screen or above
          if (position.dy <= 300) {
            if (_activeIndex != i) {
              setState(() {
                _activeIndex = i;
              });
            }
            break;
          }
        }
      }
    }
  }

  // Section 4: End-to-End Solutions
  Widget _buildSection4(double height, double width, bool isMobile) {
    final solutions = [
      {
        'title': 'Appointment Management',
        'desc':
            'Easily schedule patient appointments with a smart booking system that sends automatic reminders and follow-ups.',
        'details':
            '• Real-time calendar synchronization\n• Automated SMS and WhatsApp reminders\n• Patient self-scheduling portal\n• Recurring appointment management\n• Delay notifications to patients',
        'image': 'assets/appointment_booking.png',
      },
      {
        'title': 'Smart Prescriptions',
        'desc':
            'Digital prescriptions with dosage shortcuts and templates — saving doctors\' time and reducing errors.',
        'details':
            '• ICD-10 integration for diagnosis\n• Drug interaction alerts\n• One-click repeat prescriptions\n• Digital signature support\n• Direct pharmacy integration',
        'image': 'assets/smart_prescriptions.png',
      },
      {
        'title': 'Pharmacy Solution',
        'desc':
            'Automated billing, stock tracking, and expiry alerts — reducing waste, cutting costs, and simplifying operations.',
        'details':
            '• Inventory management with barcode support\n• Low stock and expiry date alerts\n• GST-compliant billing and invoicing\n• Supplier and purchase management\n• Prescription-to-billing workflow',
        'image': 'assets/pharmacy_solution.png',
      },
      {
        'title': 'Lab Solution',
        'desc':
            'A digital lab dashboard for instant doctor orders, sample collection, and online results.',
        'details':
            '• Digital lab requisition forms\n• Sample tracking with barcodes\n• Automated report generation\n• Patient access to results via app\n• Integration with lab equipment',
        'image': 'assets/lab_solution.png',
      },
      // {
      //   'title': 'Imaging Solution',
      //   'desc':
      //       'Digital radiology orders and real-time report viewing for X-rays, MRIs, and Scans.',
      //   'details':
      //       '• DICOM viewer integration\n• Cloud-based image storage (PACS)\n• Radiologist reporting portal\n• Mobile access to reports\n• Historical image comparison',
      //   'image': 'assets/imaging_solution.png',
      // },
      {
        'title': 'Video consultation',
        'desc':
            'Provide seamless virtual consultations with secure, high-quality video calls and image sharing from anywhere.',
        'details':
            '• End-to-end encrypted video calls\n• Integrated chat and file sharing\n• Virtual waiting room\n• On-call prescription entry\n• Multilingual support',
        'image': 'assets/video_consultation.png',
      },
      {
        'title': 'Mobile App',
        'desc':
            'Bring healthcare to your fingertips with a dedicated patient and doctor app for prescriptions and reports.',
        'details':
            '• Real-time reports & prescriptions\n• Secure doctor-patient chat\n• Instant push notifications\n• Health tracking dashboard\n• Effortless appointment booking',
        'image': 'assets/mobile_app.png',
      },
      {
        'title': 'HRMS Solution',
        'desc':
            'Manage your medical staff efficiently with automated payroll, attendance, and performance analytics.',
        'details':
            '• Automated payroll processing\n• Attendance tracking with GPS\n• Shift & rotation management\n• Staff performance analytics\n• Leave & expense management',
        'image': 'assets/hrms_solution.png',
      },
    ];

    return Container(
      width: width,
      height: height, // Enforce height
      decoration: const BoxDecoration(
        color: white,
        // Subtle gradient for premium feel
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFFFFFF), Color(0xFFF8F8F8)],
        ),
      ),
      child: Stack(
        children: [
          // Premium Radial Vignette for Depth
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.2,
                  colors: [
                    white,
                    const Color(
                      0xFFF2F4F7,
                    ), // Soft tech gray for professional depth
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: isMobile ? 20 : 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 1),

                // Badge / Pill
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: red.withOpacity(0.15)),
                    boxShadow: [
                      BoxShadow(
                        color: red.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Color(0xFF4CAF50),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'OUR SOLUTIONS',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: red,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 19),

                // Centered Header
                RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    style: GoogleFonts.outfit(
                      // Updated to Outfit
                      fontSize: isMobile ? 32 : (height < 700 ? 36 : 48),
                      fontWeight: FontWeight.bold,
                      color: darkGray,
                      height: 1.1,
                      letterSpacing: -0.5,
                    ),
                    children: const [
                      TextSpan(text: 'End-to-End Solutions for Your\n'),
                      TextSpan(text: 'Clinic or Hospital — '),
                      TextSpan(
                        text: 'Your Choice.',
                        style: TextStyle(color: red),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Adopt the full suite or select only the solutions you need',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 15 : 18,
                    color: mediumGray,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                // Premium Accent Line - Centered
                Container(
                  width: 80,
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [red.withOpacity(0.1), red, red.withOpacity(0.1)],
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const Spacer(flex: 1),

                // Navigation Buttons (Desktop only)
                if (!isMobile && height > 600) ...[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildNavButton(
                          icon: Icons.arrow_back,
                          color: red,
                          iconColor: white,
                          onTap: () {
                            _solutionsController.animateTo(
                              _solutionsController.offset - 400,
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.fastOutSlowIn,
                            );
                          },
                        ),
                        const SizedBox(width: 16),
                        _buildNavButton(
                          icon: Icons.arrow_forward,
                          color: red,
                          iconColor: white,
                          onTap: () {
                            _solutionsController.animateTo(
                              _solutionsController.offset + 400,
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.fastOutSlowIn,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],

                // Solutions List - Flexible Height
                Expanded(
                  flex: 12,
                  child: ListView.separated(
                    controller: _solutionsController,
                    scrollDirection: Axis.horizontal,
                    itemCount: solutions.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 24),
                    itemBuilder: (context, index) {
                      final item = solutions[index];
                      return _SolutionCard(
                        item: item,
                        isFeatured: false,
                        width: isMobile ? width * 0.85 : 360,
                      );
                    },
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton({
    required IconData icon,
    required Color color,
    required Color iconColor,
    VoidCallback? onTap,
  }) {
    return _NavButton(
      icon: icon,
      color: color,
      iconColor: iconColor,
      onTap: onTap,
    );
  }

  Widget _buildSection5(double height, double width, bool isMobile) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: black,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0F0F0F), Color(0xFF000000)],
        ),
      ),
      child: Stack(
        children: [
          // Elegant Background Accents
          Positioned(
            top: -height * 0.2,
            right: -width * 0.1,
            child: Container(
              width: width * 0.5,
              height: width * 0.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [red.withOpacity(0.08), Colors.transparent],
                ),
              ),
            ),
          ),

          // Neural Tech Texture
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/neural-pattern-dark.png',
                fit: BoxFit.cover,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),

          // Main Center Content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: isMobile ? 30 : 60,
            ),
            child: Align(
              alignment: isMobile ? Alignment.center : Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: isMobile ? Alignment.center : Alignment.centerLeft,
                child: SizedBox(
                  width: isMobile ? width - 48 : 1200,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: isMobile
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      // Executive Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: white.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: red.withOpacity(0.3)),
                        ),
                        child: Text(
                          'PLATFORM EXCELLENCE',
                          style: GoogleFonts.inter(
                            color: white.withOpacity(0.8),
                            fontWeight: FontWeight.w800,
                            letterSpacing: 2.0,
                            fontSize: 9,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // High-Impact Headline
                      RichText(
                        textAlign: isMobile ? TextAlign.center : TextAlign.left,
                        text: TextSpan(
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: isMobile ? 42 : 84,
                            fontWeight: FontWeight.w800,
                            color: white,
                            height: 1.05,
                            letterSpacing: -2.0,
                          ),
                          children: [
                            const TextSpan(text: 'Defining the '),
                            TextSpan(
                              text: 'Premium\nHealthcare',
                              style: TextStyle(
                                color: red,
                                fontWeight: FontWeight.w900,
                                shadows: [
                                  Shadow(
                                    color: red.withOpacity(0.3),
                                    blurRadius: 40,
                                  ),
                                ],
                              ),
                            ),
                            const TextSpan(text: ' Experience'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Elite Description
                      Container(
                        constraints: const BoxConstraints(maxWidth: 700),
                        child: Text(
                          'We provide an unparalleled digital ecosystem for modern clinicians who demand precision, efficiency, and aesthetic excellence in their daily operations.',
                          textAlign: isMobile
                              ? TextAlign.center
                              : TextAlign.left,
                          style: GoogleFonts.inter(
                            fontSize: isMobile ? 20 : 22,
                            color: white.withOpacity(0.5),
                            height: 1.6,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 56),

                      // Glass Metrics Row
                      isMobile
                          ? Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildHighImpactMetric(
                                        '70%',
                                        'Wait Reduction',
                                        isMobile,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: _buildHighImpactMetric(
                                        '100%',
                                        'Paperless Flow',
                                        isMobile,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                _buildHighImpactMetric(
                                  '360°',
                                  'Patient Visibility',
                                  isMobile,
                                  isCentered: true,
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _buildHighImpactMetric(
                                  '70%',
                                  'Wait Reduction',
                                  isMobile,
                                ),
                                const SizedBox(width: 32),
                                _buildHighImpactMetric(
                                  '100%',
                                  'Paperless Flow',
                                  isMobile,
                                ),
                                const SizedBox(width: 32),
                                _buildHighImpactMetric(
                                  '360°',
                                  'Patient Visibility',
                                  isMobile,
                                ),
                              ],
                            ),
                      const SizedBox(height: 56),

                      isMobile
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildClassicFeaturePoint(
                                      'Enterprise Scalability',
                                      isMobile: true,
                                    ),
                                    const SizedBox(width: 24),
                                    _buildClassicFeaturePoint(
                                      'AI Diagnostics',
                                      isMobile: true,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                _buildClassicFeaturePoint(
                                  'Global Cloud Architecture',
                                  isMobile: true,
                                ),
                              ],
                            )
                          : Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 48,
                              runSpacing: 24,
                              children: [
                                _buildClassicFeaturePoint('Enterprise Scalability'),
                                _buildClassicFeaturePoint('AI Diagnostics'),
                                _buildClassicFeaturePoint(
                                  'Global Cloud Architecture',
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighImpactMetric(String value, String label, bool isMobile,
      {bool isCentered = false}) {
    // If centered on mobile, wrap with Center
    Widget box = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: isMobile ? (isCentered ? 200 : null) : 280,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 28,
            vertical: isMobile ? 20 : 32,
          ),
          decoration: BoxDecoration(
            color: white.withOpacity(0.02),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: white.withOpacity(0.08), width: 1.5),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [white.withOpacity(0.05), Colors.transparent],
            ),
          ),
          child: Column(
            crossAxisAlignment: isMobile
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: isMobile ? 32 : 64,
                  fontWeight: FontWeight.w900,
                  color: white,
                  letterSpacing: -3.0,
                  shadows: [
                    Shadow(color: red.withOpacity(0.4), blurRadius: 20),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(width: 32, height: 2, color: red),
              const SizedBox(height: 16),
              Text(
                label.toUpperCase(),
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 9 : 11,
                  fontWeight: FontWeight.w900,
                  color: white.withOpacity(0.4),
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (isMobile && isCentered) {
      return Center(child: box);
    }
    return box;
  }

  Widget _buildClassicFeaturePoint(String text, {bool isMobile = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(isMobile ? 6 : 8),
          decoration: BoxDecoration(
            color: red.withOpacity(0.1),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: red.withOpacity(0.2),
                blurRadius: isMobile ? 8 : 12,
                spreadRadius: -4,
              ),
            ],
          ),
          child: Icon(
            Icons.check_rounded,
            color: red,
            size: isMobile ? 12 : 16,
          ),
        ),
        SizedBox(width: isMobile ? 10 : 16),
        Text(
          text,
          style: GoogleFonts.plusJakartaSans(
            fontSize: isMobile ? 13 : 17,
            color: white.withOpacity(0.9),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }

  Widget _buildAccordionItem(
    String title,
    String description, {
    bool isExpanded = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              isExpanded ? '—' : '+',
              style: GoogleFonts.roboto(fontSize: 20, color: white),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.roboto(fontSize: 20, color: white),
              ),
            ),
          ],
        ),
        if (isExpanded && description.isNotEmpty) ...[
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              description,
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: white,
                height: 1.5,
              ),
            ),
          ),
        ],
        const SizedBox(height: 20),
        Container(height: 1, color: white),
        const SizedBox(height: 20),
      ],
    );
  }

  void _showPrivacyPolicyDialog() {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: const Color(0xFF1A1A1A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: white.withOpacity(0.1), width: 1),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: red.withOpacity(0.2)),
                    ),
                    child: const Icon(
                      Icons.privacy_tip_outlined,
                      color: red,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Privacy Policy',
                      style: GoogleFonts.outfit(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white70),
                    onPressed: () => Navigator.of(ctx).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDisclaimerSection(
                        'Introduction',
                        'This Privacy Policy explains how DOCTOR AND ME, operated by DOCTOR AND ME AI TECHNOLOGIES LLP ("Company", "we", "our", "us"), collects, uses, stores, processes, and protects information when you access or use our website, web application, mobile application, and related services (collectively, the "Platform").\n\nThe Platform is a global healthcare technology Software-as-a-Service (SaaS) solution designed for clinics, hospitals, pharmacies, laboratories, and healthcare professionals to manage appointments, consultations, prescriptions, pharmacy, laboratory, inpatient, billing, insurance, and administrative workflows.',
                      ),
                      _buildDisclaimerSection(
                        'Policy Updates',
                        'This Privacy Policy may be subject to further changes including as may be warranted by change in law. Upon updating the Policy, we may revise the "Updated" date at the bottom of this Policy. We therefore request you to go through our Privacy Policy frequently to be updated with changes incorporated from time to time. Your continued engagement with us will imply your acceptance of such updates to this Policy.\n\nIf you do not agree to the terms of this Privacy Policy, please do not (i) access or use our Platform, (ii) avail of services from us, and do not disclose your information to us.\n\nBy using the Platform, you acknowledge that you have read and understood this Privacy Policy.',
                      ),
                      _buildDisclaimerSection(
                        'Scope & Applicability',
                        'This Privacy Policy applies to:\n\n• Clinics, hospitals, pharmacies, and laboratories using the Platform\n• Doctors, nurses, pharmacists, lab technicians, receptionists, and administrative staff',
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: red.withOpacity(0.2)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact Information',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'DOCTOR AND ME AI TECHNOLOGIES LLP\nEmail: contactus@doctorandmeonline.com',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: white.withOpacity(0.7),
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Close Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Close',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTermsConditionsDialog() {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: const Color(0xFF1A1A1A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: white.withOpacity(0.1), width: 1),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: red.withOpacity(0.2)),
                    ),
                    child: const Icon(
                      Icons.description_outlined,
                      color: red,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Terms & Conditions',
                      style: GoogleFonts.outfit(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white70),
                    onPressed: () => Navigator.of(ctx).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: red.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: red.withOpacity(0.2)),
                        ),
                        child: Text(
                          'Effective Date: 01-01-2026',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: red,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'These Terms and Conditions ("Terms") govern the access to and use of the DOCTOR AND ME platform (the "Platform"), operated by DOCTOR AND ME AI TECHNOLOGIES LLP ("Company", "we", "our", "us"). By accessing or using the Platform, you agree to be bound by these Terms.',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: white.withOpacity(0.7),
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildDisclaimerSection(
                        '1. Nature of the Platform',
                        'DOCTOR AND ME is a software-as-a-service (SaaS) technology platform that enables clinics, hospitals, doctors, pharmacies, laboratories, and related healthcare providers to manage appointments, patient records, prescriptions, billing, pharmacy, laboratory, and inpatient workflows.\n\nThe Platform does not provide medical advice, diagnosis, or treatment. All clinical decisions are made solely by licensed healthcare professionals.\n\nThe use of the Platform does not create a doctor-patient, clinic-patient, or healthcare provider-patient relationship between the Company and any user or patient.',
                      ),
                      _buildDisclaimerSection(
                        '2. Eligibility',
                        'You must be legally capable of entering into a binding contract to use the Platform. Healthcare providers must hold all valid licenses, registrations, and approvals required under applicable laws in their jurisdiction.',
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: red.withOpacity(0.2)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact Information',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'DOCTOR AND ME AI TECHNOLOGIES LLP\nEmail: contactus@doctorandmeonline.com',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: white.withOpacity(0.7),
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Close Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Close',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDisclaimerDialog() {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: const Color(0xFF1A1A1A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: white.withOpacity(0.1), width: 1),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: red.withOpacity(0.2)),
                    ),
                    child: const Icon(
                      Icons.info_outline_rounded,
                      color: red,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Disclaimer',
                      style: GoogleFonts.outfit(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white70),
                    onPressed: () => Navigator.of(ctx).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDisclaimerSection(
                        '1. Platform Nature & Scope',
                        'DOCTOR AND ME ("Dr & Me"), operated by DOCTOR AND ME AI TECHNOLOGIES LLP, is a healthcare technology Software-as-a-Service (SaaS) platform. The Platform is designed to enable clinics, hospitals, pharmacies, laboratories, and licensed healthcare professionals to manage appointments, consultations, prescriptions, laboratory reports, billing, insurance, and administrative workflows.\n\nDr & Me does not operate as a medical establishment, hospital, clinic, pharmacy, or laboratory.',
                      ),
                      _buildDisclaimerSection(
                        '2. No Medical Advice or Treatment',
                        'Dr & Me does not provide medical advice, diagnosis, treatment, or clinical services of any kind.\n\nAll medical information, consultations, prescriptions, diagnoses, treatment decisions, and patient care services made available through the Platform are provided solely by independent, licensed healthcare professionals or healthcare organizations using the Platform.\n\nMedical decisions and outcomes remain the sole responsibility of the treating healthcare professional and healthcare establishment.',
                      ),
                      _buildDisclaimerSection(
                        '3. No Doctor–Patient Relationship with the Company',
                        'Use of the Platform does not create a doctor–patient, clinic–patient, or healthcare provider–patient relationship between the user or patient and DOCTOR AND ME AI TECHNOLOGIES LLP.\n\nAny doctor–patient relationship is strictly between the patient and the consulting healthcare professional or healthcare organization.',
                      ),
                      _buildDisclaimerSection(
                        '4. Accuracy of Medical Information',
                        'Dr & Me does not verify, validate, or independently confirm the accuracy, completeness, or correctness of medical data, prescriptions, clinical notes, laboratory results, billing information, or any healthcare content entered or generated by healthcare professionals or clinics on the Platform.\n\nThe Company shall not be responsible for any consequences arising from inaccurate, incomplete, outdated, or incorrect information entered by users of the Platform.',
                      ),
                      _buildDisclaimerSection(
                        '5. Emergency Disclaimer',
                        'The Platform is not intended for medical emergencies.\n\nIf a user or patient is experiencing a medical emergency, they must immediately contact local emergency services or visit the nearest medical facility. Dr & Me shall not be used as a substitute for emergency medical care.',
                      ),
                      _buildDisclaimerSection(
                        '6. Technology & Availability Disclaimer',
                        'The Platform is provided on an "as-is" and "as-available" basis.\n\nWhile reasonable efforts are made to ensure system availability and reliability, Dr & Me does not guarantee uninterrupted access, error-free operation, or continuous availability of the Platform. Service interruptions may occur due to maintenance, technical issues, third-party service failures, force majeure events, or factors beyond the Company\'s control.',
                      ),
                      _buildDisclaimerSection(
                        '7. Third-Party Services',
                        'The Platform may integrate with third-party services such as payment gateways, SMS/WhatsApp providers, cloud hosting providers, pharmacies, laboratories, or other service providers.\n\nDr & Me does not control and is not responsible for the availability, accuracy, compliance, or performance of third-party services. Use of such services is subject to the respective third party\'s terms and policies.',
                      ),
                      _buildDisclaimerSection(
                        '8. Limitation of Liability',
                        'To the maximum extent permitted by applicable law, DOCTOR AND ME AI TECHNOLOGIES LLP shall not be liable for any direct, indirect, incidental, consequential, or special damages, including but not limited to medical outcomes, loss of data, loss of business, loss of profits, or patient harm arising from:\n\n• Use or inability to use the Platform\n• Clinical decisions made by healthcare professionals\n• Errors or omissions in medical records or prescriptions\n• Unauthorized access or data breaches beyond reasonable control',
                      ),
                      _buildDisclaimerSection(
                        '9. Regulatory & Legal Compliance',
                        'Healthcare organizations, doctors, clinics, hospitals, pharmacies, and laboratories using the Platform are solely responsible for complying with applicable healthcare, medical, insurance, and data protection laws in their respective jurisdictions, including India and GCC countries.\n\nThe Company does not provide legal, medical, or regulatory advice.',
                      ),
                      _buildDisclaimerSection(
                        '10. Acceptance of Disclaimer',
                        'By accessing or using the Dr & Me website, web application, or mobile application, users acknowledge that they have read, understood, and agreed to this Disclaimer, along with the Privacy Policy and Terms & Conditions.',
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: red.withOpacity(0.2)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact Information',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'DOCTOR AND ME AI TECHNOLOGIES LLP\nEmail: contactus@doctorandmeonline.com',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: white.withOpacity(0.7),
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Close Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Close',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDisclaimerSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: red,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: white.withOpacity(0.7),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class _SolutionCard extends StatefulWidget {
  final Map<String, dynamic> item;
  final bool isFeatured;
  final double width;

  const _SolutionCard({
    Key? key,
    required this.item,
    required this.isFeatured,
    required this.width,
  }) : super(key: key);

  @override
  State<_SolutionCard> createState() => _SolutionCardState();
}

class _SolutionCardState extends State<_SolutionCard> {
  bool isHovered = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Card is active if it's featured ("Lab Solution"), currently hovered, or expanded
    final isActive = isHovered || widget.isFeatured || isExpanded;
    const red = Color(0xFFFF3B30);
    const white = Color(0xFFFFFFFF);
    const mediumGray = Color(0xFF666666);
    const darkGray = Color(0xFF222222);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width,
        margin: const EdgeInsets.only(bottom: 24), // Space for shadow
        transform: Matrix4.identity()..scale(isHovered ? 1.02 : 1.0),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive
                ? red.withOpacity(0.4)
                : Colors.grey.withOpacity(0.1),
            width: isActive ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isActive
                  ? red.withOpacity(0.18)
                  : Colors.black.withOpacity(0.04),
              blurRadius: isActive ? 35 : 15,
              offset: isActive ? const Offset(0, 15) : const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section - Shrinks when expanded
            AnimatedExpanded(
              flex: isExpanded ? 2 : 6,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      widget.item['image']!,
                      fit: BoxFit.cover,
                      errorBuilder: (c, o, s) => Container(
                        color: Colors.grey.shade200,
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.grey.shade400,
                          size: 40,
                        ),
                      ),
                    ),
                    // Gradient Overlay - fades out slightly when shrunk
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: isExpanded ? 0.4 : 1.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.2),
                              Colors.black.withOpacity(0.7),
                            ],
                            stops: const [0.4, 0.7, 1.0],
                          ),
                        ),
                      ),
                    ),
                    // Title Overlay - Moves or changes style when shrunk
                    Positioned(
                      bottom: isExpanded ? 10 : 16,
                      left: 20,
                      right: 20,
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: GoogleFonts.inter(
                          fontSize: isExpanded ? 14 : 18,
                          fontWeight: FontWeight.bold,
                          color: white,
                          height: 1.2,
                        ),
                        child: Text(widget.item['title']!),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Content Section - Grows when expanded
            AnimatedExpanded(
              flex: isExpanded ? 8 : 4,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: AnimatedCrossFade(
                          firstChild: Text(
                            widget.item['desc']!,
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              height: 1.6,
                              color: mediumGray,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                          secondChild: Text(
                            widget.item['details'] ?? widget.item['desc']!,
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              height: 1.7,
                              color: darkGray,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          crossFadeState: isExpanded
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 300),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () => setState(() => isExpanded = !isExpanded),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              isExpanded ? 'Show less' : 'Learn more',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: isActive ? red : darkGray,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.arrow_forward_rounded,
                              size: 16,
                              color: isActive ? red : darkGray,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper widget for animated Flex
class AnimatedExpanded extends StatelessWidget {
  final int flex;
  final Widget child;
  final Duration duration;
  final Curve curve;

  const AnimatedExpanded({
    Key? key,
    required this.flex,
    required this.child,
    required this.duration,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(end: flex.toDouble()),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Expanded(flex: (value * 100).toInt(), child: child!);
      },
      child: child,
    );
  }
}

class _NavButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback? onTap;

  const _NavButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.iconColor,
    this.onTap,
  }) : super(key: key);

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool isPressed = false;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    const white = Color(0xFFFFFFFF);

    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) {
        setState(() => isPressed = false);
        widget.onTap?.call();
      },
      onTapCancel: () => setState(() => isPressed = false),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: isPressed
                ? white
                : (isHovered ? widget.color : white.withOpacity(0.8)),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isHovered ? widget.color : widget.color.withOpacity(0.15),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: isHovered
                    ? widget.color.withOpacity(0.25)
                    : Colors.black.withOpacity(0.03),
                blurRadius: isHovered ? 15 : 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Icon(
              widget.icon,
              color: isPressed
                  ? widget.color
                  : (isHovered ? white : widget.color),
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class _IntroNavLink extends StatefulWidget {
  final String text;
  final bool active;
  final VoidCallback onTap;

  const _IntroNavLink({
    required this.text,
    required this.active,
    required this.onTap,
  });

  @override
  State<_IntroNavLink> createState() => _IntroNavLinkState();
}

class _IntroNavLinkState extends State<_IntroNavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 36),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: widget.active || _isHovered
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: widget.active
                      ? Colors.white
                      : (_isHovered
                            ? Colors.white
                            : Colors.white.withOpacity(0.7)),
                  letterSpacing: 0.2,
                ),
                child: Text(widget.text),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                width: widget.active ? 18 : (_isHovered ? 12 : 0),
                height: 2,
                decoration: BoxDecoration(
                  color: widget.active
                      ? Colors.red
                      : Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
