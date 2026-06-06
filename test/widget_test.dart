// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:drandme/main.dart';

void main() {
  testWidgets('App loads without crashing', (WidgetTester tester) async {
    // Initialize Hive for testing
    await Hive.initFlutter();

    // Create a test AuthViewModel
    final authVM = AuthViewModel();
    await authVM.initialize();

    // Build our app and trigger a frame.
    await tester.pumpWidget(DoctorAndMeApp(authViewModel: authVM));

    // Verify that the app loads (should show login screen since not authenticated)
    expect(find.text('Sign In'), findsOneWidget);
  });
}
