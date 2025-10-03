# Dr&Me Healthcare Management System

A Flutter web application for healthcare management with a modern, responsive design.

## Features

### Welcome Screen
- **Pixel-perfect recreation** of the provided design
- **Split layout**: Dark left panel with branding and navigation, light right panel with login/CTA buttons
- **Responsive design**: Adapts to mobile and desktop screens
- **Interactive elements**: Login button, demo booking button, navigation menu
- **Custom background patterns**: Subtle animated patterns for visual appeal

### Login Screen
- **Professional login form** with email and password fields
- **Form validation** with real-time feedback
- **Social login options** (Google, Apple)
- **Remember me** functionality
- **Forgot password** link
- **Responsive layout** for mobile and desktop
- **Loading states** with smooth transitions

### Dashboard with Sidebar
- **Collapsible sidebar** navigation
- **Multiple sections**: Dashboard, Appointments, Roles, Payroll, Reports, Settings
- **Appointments management** with full table functionality
- **Mobile drawer** navigation for smaller screens
- **User profile** section in sidebar
- **Smooth animations** and transitions

## Technical Implementation

### Architecture
- **Modular structure** with separate screens and widgets
- **Responsive design** using LayoutBuilder and MediaQuery
- **State management** with StatefulWidget for interactive components
- **Navigation flow**: Welcome → Login → Dashboard

### Design System
- **Color palette**: 
  - Primary Red: `#E53935`
  - Dark Background: `#1A1A1A`
  - White: `#FFFFFF`
  - Gray tones for text and borders
- **Typography**: Google Fonts Poppins throughout
- **Spacing**: Consistent padding and margins
- **Border radius**: 8px for buttons and cards

### Responsive Breakpoints
- **Mobile**: < 768px (stacked layout)
- **Desktop**: ≥ 768px (side-by-side layout)

## File Structure

```
lib/
├── main.dart                          # App entry point
├── screens/
│   ├── welcome_screen.dart            # Welcome/landing screen
│   ├── login_screen.dart              # Login form screen
│   ├── dashboard_with_sidebar.dart    # Main dashboard with sidebar
│   ├── appointments_dashboard.dart    # Appointments management
│   ├── appointment_details.dart      # Appointment details view
│   ├── new_appointment.dart          # Create new appointment
│   ├── payment_confirmation_modal.dart
│   └── reschedule_modal.dart
└── widgets/
    └── responsive_layout.dart         # Responsive layout utilities
```

## Getting Started

1. **Install dependencies**:
   ```bash
   flutter pub get
   ```

2. **Run the application**:
   ```bash
   flutter run -d chrome --web-port=8080
   ```

3. **Navigate through the app**:
   - Start at the Welcome screen
   - Click "Login" to go to the login form
   - Enter any email/password to access the dashboard
   - Use the sidebar to navigate between different sections

## Key Features Implemented

### ✅ Welcome Screen
- Split layout with dark left and light right panels
- Dr&Me branding with red and white color scheme
- Navigation menu (Home, Product, Pricing, Contact)
- Main headline with "Transform Your Clinic Into a Smart, Future-Ready Healthcare Hub"
- Sub-headline about AI-Powered Platform
- Call-to-action buttons (Book as Demo, Start 14 days free trail)
- Login button that navigates to login screen
- Responsive design for mobile and desktop
- Custom background patterns and animations

### ✅ Login Screen
- Professional login form with email and password fields
- Form validation with error messages
- Password visibility toggle
- Remember me checkbox
- Forgot password link
- Social login buttons (Google, Apple)
- Sign up link
- Loading state during login process
- Responsive layout for mobile and desktop
- Navigation to dashboard after successful login

### ✅ Dashboard with Sidebar
- Collapsible sidebar with Dr&Me branding
- Navigation menu with icons and labels
- User profile section
- Multiple dashboard sections (Dashboard, Appointments, Roles, Payroll, Reports, Settings)
- Mobile drawer navigation
- Smooth animations and transitions
- Integration with existing appointments dashboard
- Responsive design for all screen sizes

## Design Accuracy

The implementation maintains **pixel-perfect accuracy** to the provided design:
- Exact color matching (`#E53935` red, `#1A1A1A` dark background)
- Proper typography with Google Fonts Poppins
- Correct spacing and padding
- Responsive behavior matching the original design
- Interactive elements with proper hover and focus states

## Future Enhancements

- Add more dashboard sections with real functionality
- Implement user authentication with backend
- Add data persistence
- Enhance animations and micro-interactions
- Add more responsive breakpoints
- Implement dark/light theme toggle