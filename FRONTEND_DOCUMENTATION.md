# Frontend Documentation - Dr. & Me (AeroServe)

## 1. Project Overview
This project is a comprehensive healthcare management system frontend built with Flutter. It includes modules for Clinics, Doctors, Patients, and Super Administrators, allowing for management of appointments, users, organizations, and clinic settings.

## 2. Technology Stack

*   **Framework:** Flutter
*   **Language:** Dart
*   **State Management:** Provider (ChangeNotifier)
*   **Navigation:** GoRouter
*   **Networking:** Http
*   **Local Storage:** Hive
*   **Code Generation:** Freezed, Json Serializable
*   **Styling:** Google Fonts (Poppins), Responsive UI

## 3. Project Structure

The project follows a modular architecture, separating features into distinct modules within the `lib/modules` directory.

### Core Directories (`lib/`)
*   `core/`: Shared resources, utilities, configuration, and widgets.
    *   `config/`: App configuration (Router, Providers).
    *   `constants/`: App-wide constants.
    *   `repositories/`: Data repositories.
    *   `services/`: Core services (e.g., TokenRefresh).
    *   `utils/`: Utility functions.
    *   `widgets/`: Reusable widgets.
*   `modules/`: Feature-specific code (Views, ViewModels, Models).
*   `views/`: Shared or main app views.
*   `main.dart`: Application entry point.

## 4. Modules & Features

### 4.1. Clinic Module (`lib/modules/clinic`)
This is the core module for clinic management.
*   **Dashboard:** `ClinicAdminDashboardView`, `ClinicModuleView` - Main overview of clinic activities.
*   **Appointments:** Extensive appointment management system (`views/appointments`).
    *   Likely features: Booking, specific slot configuration, detail views.
*   **Doctors:** Management of doctors within the clinic (`views/doctors`, `doctor_details_content.dart`).
*   **Patients:** Management of patient records (`views/patients`).
*   **Settings:** Clinic configuration (`ClinicSettingsView`).
*   **Slot Configuration:** Managing availability slots (`SlotConfigurationWidget`, `SimpleSlotWidget`).

### 4.2. Super Admin Module (`lib/modules/superadmin`)
Administrative module for high-level management.
*   **Dashboard:** System-wide overview (`dashboard`).
*   **Organization Management:** Managing organizations (`organizations`).
*   **Clinic Management:** Managing clinics (`clinics`).
*   **Department Management:** Managing departments (`departments`).
*   **User Management:** Managing users and roles (`users`, `roles`).
*   **Doctor Management:** Managing doctors at a system level (`doctors`).

### 4.3. Auth Module (`lib/modules/auth`)
Handles user authentication.
*   Detailed views for Login, Registration, and Password Recovery (inferred).

### 4.4. Doctor Module (`lib/modules/doctor`)
Features specific to the Doctor role.
*   Likely contains a dashboard for doctors to view their appointments and schedule.

### 4.5. Patient Module (`lib/modules/patient`)
Features specific to the Patient role.
*   Likely contains patient-specific views (e.g., their own appointments, records).

### 4.6. Organization Module (`lib/modules/organization`)
Features for Organization level management.

## 5. State Management approach
The application uses the **Provider** package for state management.
*   **ViewModels:** Each view/feature has a corresponding ViewModel (e.g., `ClinicViewModel`, `AuthViewModel`) extending `ChangeNotifier`.
*   **Dependency Injection:** Providers are initialized in `main.dart` and `AppProviders`, dynamically loaded based on the user's role/authentication state.

## 6. Navigation
Navigation is handled by **GoRouter**, defined in `lib/core/config/app_router.dart`.
*   Supports deep linking and nested routes.
*   Route guards likely used for role-based access control.
