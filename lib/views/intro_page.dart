import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

/// Full-screen intro page with 5 sections matching the uploaded designs
class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController();

  // Color constants matching the designs
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFFF3B30);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFE0E0E0);
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
      precacheImage(const AssetImage('assets/vr-person.png'), context);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(parent: BouncingScrollPhysics()),
        children: [
          // Section 1: Split-screen hero section (was Section 3)
          _buildSection3(screenHeight, screenWidth, isMobile),
          // Section 2: End-to-End Solutions (was Section 4)
          _buildSection4(screenHeight, screenWidth, isMobile),
          // Section 3: Why Choose Dr&Me (was Section 5)
          _buildSection5(screenHeight, screenWidth, isMobile),
          // Section 4: Connect With Us (was Section 2)
          _buildSection2(screenHeight, screenWidth, isMobile),
          // Section 5: Landing page with black background and red footer (was Section 1)
          _buildSection1(screenHeight, screenWidth, isMobile),
        ],
      ),
    );
  }

  // ... (All the existing section builders will go here)
  // I need to keep the original section 1, 2, 4, 5 intact and just update section 3

  // Section 5: Landing page with black background and red footer
  Widget _buildSection1(double height, double width, bool isMobile) {
    return Container(
      height: height,
      width: width,
      child: Column(
        children: [
          // Top black section (65-70% of height)
          Expanded(
            flex: isMobile ? 65 : 70,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: black,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80,
                vertical: isMobile ? 40 : 60,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.roboto(
                        fontSize: isMobile ? 32 : 48,
                        fontWeight: FontWeight.bold,
                        color: white,
                        height: 1.2,
                      ),
                      children: const [
                        TextSpan(text: 'Ready to Scale Your\n'),
                        TextSpan(
                          text: 'Venture?',
                          style: TextStyle(color: red),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Body text
                  Text(
                    'Experience the power of Suseio with a 14-day free trial. No credit card required. Unlock the full potential of your business with our advanced marketing solutions.',
                    style: GoogleFonts.roboto(
                      fontSize: isMobile ? 14 : 18,
                      fontWeight: FontWeight.normal,
                      color: white,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // CTA Button
                  Material(
                    color: red,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Start 14 days free trail',
                              style: GoogleFonts.roboto(
                                fontSize: isMobile ? 14 : 16,
                                fontWeight: FontWeight.normal,
                                color: white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.arrow_forward,
                              color: white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom red footer section (30-35% of height)
          Expanded(
            flex: isMobile ? 35 : 30,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: red),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80,
                vertical: isMobile ? 30 : 50,
              ),
              child: isMobile
                  ? _buildMobileFooter()
                  : _buildDesktopFooter(width),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileFooter() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo
          Text(
            'Dr&Me',
            style: GoogleFonts.roboto(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
          const SizedBox(height: 20),
          // App buttons
          _buildAppStoreButton(),
          const SizedBox(height: 12),
          _buildGooglePlayButton(),
          const SizedBox(height: 30),
          // Footer links
          _buildFooterLinksMobile(),
          const SizedBox(height: 30),
          // Copyright and social
          _buildCopyrightAndSocial(),
        ],
      ),
    );
  }

  Widget _buildDesktopFooter(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left column: Logo and app buttons
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr&Me',
                    style: GoogleFonts.roboto(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildAppStoreButton(),
                  const SizedBox(height: 12),
                  _buildGooglePlayButton(),
                ],
              ),
              const SizedBox(width: 60),
              // Right columns: Footer links
              Expanded(child: _buildFooterLinksDesktop()),
            ],
          ),
        ),
        // Copyright and social at bottom
        _buildCopyrightAndSocial(),
      ],
    );
  }

  Widget _buildAppStoreButton() {
    return Material(
      color: black,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.apple, color: white, size: 24),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Download on the',
                  style: GoogleFonts.roboto(fontSize: 10, color: white),
                ),
                Text(
                  'App Store',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGooglePlayButton() {
    return Material(
      color: black,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.play_arrow, color: white, size: 24),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GET IT ON',
                  style: GoogleFonts.roboto(fontSize: 10, color: white),
                ),
                Text(
                  'Google Play',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterLinksMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFooterLinkColumn('Company Info', [
          'About Us',
          'Carrier',
          'We are hiring',
          'Blog',
        ]),
        const SizedBox(height: 20),
        _buildFooterLinkColumn('Legal', [
          'About Us',
          'Carrier',
          'We are hiring',
          'Blog',
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
        Expanded(
          child: _buildFooterLinkColumn('Company Info', [
            'About Us',
            'Carrier',
            'We are hiring',
            'Blog',
          ]),
        ),
        Expanded(
          child: _buildFooterLinkColumn('Legal', [
            'About Us',
            'Carrier',
            'We are hiring',
            'Blog',
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
        const SizedBox(height: 12),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              link,
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCopyrightAndSocial() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Made With Love By Dr&Me All Right Reserved',
          style: GoogleFonts.roboto(fontSize: 14, color: lightGray),
        ),
        Row(
          children: [
            _buildSocialIcon(Icons.facebook),
            const SizedBox(width: 16),
            _buildSocialIcon(Icons.camera_alt),
            const SizedBox(width: 16),
            _buildSocialIcon(Icons.alternate_email),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: white, width: 1),
      ),
      child: Icon(icon, color: white, size: 18),
    );
  }

  // Section 4: Connect With Us contact page
  Widget _buildSection2(double height, double width, bool isMobile) {
    return Container(
      height: height,
      width: width,
      color: white,
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
                  const SizedBox(height: 40),
                  _buildSection2ContactForm(width, isMobile),
                ],
              ),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: _buildSection2LeftContent(isMobile)),
                const SizedBox(width: 60),
                Expanded(
                  flex: 1,
                  child: _buildSection2ContactForm(width, isMobile),
                ),
              ],
            ),
    );
  }

  Widget _buildSection2LeftContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connect US',
          style: GoogleFonts.roboto(
            fontSize: isMobile ? 14 : 16,
            color: mediumGray,
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: GoogleFonts.roboto(
              fontSize: isMobile ? 32 : 42,
              fontWeight: FontWeight.bold,
              color: darkGray,
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
          style: GoogleFonts.roboto(
            fontSize: isMobile ? 14 : 16,
            color: mediumGray,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(Icons.check, color: white, size: 16),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'One-Stop Hospital Solution - Connect doctors, patients, labs, and pharmacy in one platform.',
                style: GoogleFonts.roboto(
                  fontSize: isMobile ? 14 : 16,
                  color: darkGray,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        const Divider(color: lightGray, thickness: 1),
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
        Text(
          'Contact info',
          style: GoogleFonts.roboto(fontSize: 14, color: mediumGray),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.chat_bubble_outline, color: darkGray, size: 20),
            const SizedBox(width: 8),
            Text(
              '+1890 123 456',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: darkGray,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'support@example.com',
          style: GoogleFonts.roboto(fontSize: 14, color: darkGray),
        ),
      ],
    );
  }

  Widget _buildVisitOffice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Visit our office',
          style: GoogleFonts.roboto(fontSize: 14, color: mediumGray),
        ),
        const SizedBox(height: 12),
        Text(
          '5609 E Sprague Ave, Spokane Valley, WA 99212, USA',
          style: GoogleFonts.roboto(fontSize: 14, color: darkGray),
        ),
      ],
    );
  }

  Widget _buildSection2ContactForm(double width, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: lightRedBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Connect with us!',
            style: GoogleFonts.roboto(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: darkGray,
            ),
          ),
          const SizedBox(height: 32),
          _buildFormField('Name *'),
          const SizedBox(height: 24),
          _buildFormField('Email Address *'),
          const SizedBox(height: 24),
          _buildFormField('Phone Number *'),
          const SizedBox(height: 24),
          _buildDropdownField('Service you are interested in *'),
          const SizedBox(height: 24),
          _buildTextAreaField('How can we help you?'),
          const SizedBox(height: 32),
          Material(
            color: red,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Send a Message',
                      style: GoogleFonts.roboto(fontSize: 16, color: white),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward, color: white, size: 20),
                  ],
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
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: const Color(0xFFBBBBBB),
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
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: const Color(0xFFBBBBBB),
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
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: const Color(0xFFBBBBBB),
          ),
        ),
        const SizedBox(height: 16),
        Container(height: 1, color: const Color(0xFFCCCCCC)),
      ],
    );
  }

  // Section 3: Split-screen hero section
  Widget _buildSection3(double height, double width, bool isMobile) {
    return Container(
      height: height,
      width: width,
      child: isMobile
          ? Column(
              children: [
                Expanded(
                  flex: 60,
                  child: _buildSection3LeftSide(height, width, isMobile),
                ),
                Expanded(
                  flex: 40,
                  child: _buildSection3RightSide(height, width, isMobile),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 60,
                  child: _buildSection3LeftSide(height, width, isMobile),
                ),
                Expanded(
                  flex: 40,
                  child: _buildSection3RightSide(height, width, isMobile),
                ),
              ],
            ),
    );
  }

  Widget _buildSection3LeftSide(double height, double width, bool isMobile) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF000000), // Pure black background
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 40 : 80,
      ),
      child: Stack(
        children: [
          // Pure black base
          Positioned.fill(child: Container(color: const Color(0xFF000000))),
          // Background image (neural pattern overlay on black - includes hand)
          Positioned.fill(
            child: Image.asset(
              'assets/neural-pattern-dark.png',
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
              filterQuality: FilterQuality.high,
            ),
          ),
          // Social media vertical bar on left
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: !isMobile
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.rotate(
                        angle: -math.pi / 2,
                        child: Text(
                          'FACEBOOK',
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: white,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '*',
                        style: TextStyle(color: pinkAccent, fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      Text('x', style: TextStyle(color: white, fontSize: 12)),
                      const SizedBox(height: 8),
                      Text(
                        '*',
                        style: TextStyle(color: pinkAccent, fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      Transform.rotate(
                        angle: -math.pi / 2,
                        child: Text(
                          'INSTAGRAM',
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: white,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Navigation - Exact match
                Row(
                  children: [
                    Text(
                      'Dr&Me',
                      style: GoogleFonts.inter(
                        fontSize: isMobile ? 26 : 36,
                        fontWeight: FontWeight.w900,
                        color: red,
                        letterSpacing: -0.5,
                        height: 1.0,
                      ),
                    ),
                    const Spacer(),
                    if (!isMobile) ...[
                      Text(
                        'Home',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: white,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          letterSpacing: 0,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(width: 32),
                      Text(
                        'Product',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: white.withOpacity(0.9),
                          letterSpacing: 0,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(width: 32),
                      Text(
                        'Pricing',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: white.withOpacity(0.9),
                          letterSpacing: 0,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(width: 32),
                      Text(
                        'Contact',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: white.withOpacity(0.9),
                          letterSpacing: 0,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: isMobile ? 50 : 80),
                // Headline - Perfect match to design
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 36 : 64,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.5,
                      color: white,
                      height: 1.1,
                    ),
                    children: [
                      const TextSpan(text: 'Transform Your'),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: pinkAccent,
                          fontSize: isMobile ? 20 : 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const TextSpan(text: ' Clinic\nInto a Smart,\n'),
                      TextSpan(
                        text: 'Future-Ready\n',
                        style: TextStyle(
                          color: red,
                          letterSpacing: -0.8,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: 'Healthcare Hub',
                        style: TextStyle(
                          color: red,
                          letterSpacing: -0.8,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: isMobile ? 20 : 32),
                // Sub-headline - Exact spacing
                Text(
                  'AI-Powered Platform — Plug-And-Play, Zero Infrastructure Needed',
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 14 : 18,
                    fontWeight: FontWeight.w400,
                    color: white.withOpacity(0.85),
                    letterSpacing: 0.1,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: isMobile ? 24 : 36),
                // CTA Button - Exact match
                Material(
                  color: red,
                  borderRadius: BorderRadius.circular(10),
                  elevation: 4,
                  shadowColor: red.withOpacity(0.4),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 28 : 36,
                        vertical: isMobile ? 16 : 18,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Book as Demo',
                            style: GoogleFonts.inter(
                              fontSize: isMobile ? 14 : 17,
                              fontWeight: FontWeight.w600,
                              color: white,
                              letterSpacing: 0.3,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(
                            Icons.arrow_forward,
                            color: white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection3RightSide(double height, double width, bool isMobile) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: white),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: isMobile ? 40 : 80,
      ),
      child: Stack(
        children: [
          // Background image (right side pattern from design)
          Positioned.fill(
            child: Image.asset(
              'assets/pattern-right.png',
              fit: BoxFit.cover,
              alignment: Alignment.topRight,
              filterQuality: FilterQuality.high,
            ),
          ),
          // Subtle background VR silhouette on the right (clipped to half width)
          Positioned.fill(
            child: IgnorePointer(
              ignoring: true,
              child: Align(
                alignment: Alignment.bottomRight,
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    widthFactor: 0.5, // show only the right half
                    child: Opacity(
                      opacity: 0.10,
                      child: Image.asset(
                        'assets/vr-person.png',
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                        width: isMobile ? width * 0.8 : width * 0.6,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // VR person overlay - positioned exactly as in design
          Positioned(
            right: isMobile ? -12 : -24,
            bottom: isMobile ? -6 : -8,
            child: Transform.scale(
              scaleX: -1, // face towards the left section
              child: Image.asset(
                'assets/vr-person.png',
                width: isMobile ? width * 0.68 : width * 0.46,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
                alignment: Alignment.bottomRight,
              ),
            ),
          ),
          // Main content
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => context.go('/login'),
                      child: Text(
                        'Login',
                        style: GoogleFonts.inter(
                          fontSize: isMobile ? 14 : 17,
                          fontWeight: FontWeight.w600,
                          color: red,
                          letterSpacing: 0,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Material(
                    color: red,
                    borderRadius: BorderRadius.circular(8),
                    elevation: 2,
                    shadowColor: red.withOpacity(0.3),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 18 : 22,
                          vertical: isMobile ? 11 : 13,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Start 14 days free trail',
                              style: GoogleFonts.inter(
                                fontSize: isMobile ? 12 : 15,
                                fontWeight: FontWeight.w600,
                                color: white,
                                letterSpacing: 0.15,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.arrow_forward,
                              color: white,
                              size: 17,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Pagination indicators at bottom center
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
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
                      const SizedBox(width: 6),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Section 4: End-to-End Solutions
  Widget _buildSection4(double height, double width, bool isMobile) {
    final solutions = [
      {
        'title': 'Appointment Booking & Auto Follow-up',
        'description':
            'Easily schedule patient appointments with a smart booking system that sends automatic reminders and follow-ups, reducing no-shows and improving care continuity',
      },
      {
        'title': 'Smart Prescriptions',
        'description':
            'Digital prescriptions with dosage shortcuts and templates — saving doctors\' time, reducing errors, and ensuring accurate medical records.',
      },
      {
        'title': 'Pharmacy Solution',
        'description':
            'Automated billing, stock tracking, and expiry alerts — reducing waste, cutting costs, and simplifying pharmacy operations.',
      },
      {
        'title': 'Lab Solution',
        'description':
            'A digital lab dashboard for instant doctor orders, sample collection, and online results. Faster reporting, zero paperwork.',
      },
      {
        'title': 'Video Consult',
        'description':
            'Provide seamless consultations with high-quality video. Patients can consult doctors from their homes, ensuring accessibility and convenience.',
      },
    ];

    return Container(
      height: height,
      width: width,
      color: white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: GoogleFonts.roboto(
                fontSize: isMobile ? 28 : 42,
                fontWeight: FontWeight.bold,
                color: darkGray,
              ),
              children: const [
                TextSpan(
                  text: 'End-to-End Solutions for Your Clinic or Hospital ',
                ),
                TextSpan(
                  text: '— Your Choice.',
                  style: TextStyle(color: red),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Adopt the full suite or select only the solutions you need',
            style: GoogleFonts.roboto(
              fontSize: isMobile ? 14 : 16,
              color: mediumGray,
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: solutions.length,
              itemBuilder: (context, index) {
                final isSelected = index == 3;
                return Container(
                  width: isMobile ? width * 0.8 : 380,
                  margin: EdgeInsets.only(
                    right: index < solutions.length - 1 ? 24 : 0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: isSelected
                        ? Border.all(color: red, width: 2)
                        : null,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          gradient: LinearGradient(
                            colors: [darkGray, black],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Text(
                          solutions[index]['title']!,
                          style: GoogleFonts.roboto(
                            fontSize: isMobile ? 16 : 18,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: Text(
                            solutions[index]['description']!,
                            style: GoogleFonts.roboto(
                              fontSize: isMobile ? 12 : 14,
                              color: darkGray,
                              height: 1.6,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Section 5: Why Choose Dr&Me
  Widget _buildSection5(double height, double width, bool isMobile) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [black, const Color(0xFF333333), const Color(0xFFE0E0E0)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      padding: EdgeInsets.only(
        left: isMobile ? 24 : 100,
        right: isMobile ? 24 : 100,
        top: isMobile ? 40 : 80,
        bottom: isMobile ? 40 : 80,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '70% Waiting Reduction',
              style: GoogleFonts.roboto(
                fontSize: isMobile ? 20 : 24,
                fontWeight: FontWeight.bold,
                color: white,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 24,
              runSpacing: 8,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '•',
                      style: GoogleFonts.roboto(fontSize: 16, color: white),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Higher Patient Retention',
                      style: GoogleFonts.roboto(fontSize: 16, color: white),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '•',
                      style: GoogleFonts.roboto(fontSize: 16, color: white),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '0 Paper Records',
                      style: GoogleFonts.roboto(fontSize: 16, color: white),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '•',
                      style: GoogleFonts.roboto(fontSize: 16, color: white),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Plug & Play Setup',
                      style: GoogleFonts.roboto(fontSize: 16, color: white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            RichText(
              text: TextSpan(
                style: GoogleFonts.roboto(
                  fontSize: isMobile ? 32 : 48,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
                children: const [
                  TextSpan(text: 'Why Choose '),
                  TextSpan(
                    text: 'Dr&Me?',
                    style: TextStyle(color: red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ...[
              _buildAccordionItem(
                'End-to-End Patient Flow',
                'One token across doctors, pharmacy, lab, and billing for a seamless experience.',
                isExpanded: true,
              ),
              _buildAccordionItem('Maximized Revenue', ''),
              _buildAccordionItem('Real-Time Insights', ''),
              _buildAccordionItem('Plug & Play Simplicity', ''),
              _buildAccordionItem('Patient Loyalty & Growth', ''),
            ],
          ],
        ),
      ),
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
}
