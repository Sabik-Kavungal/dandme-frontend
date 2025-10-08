# Core Module

This directory contains the core functionality and utilities used throughout the application. It follows a clean architecture pattern with clear separation of concerns.

## Structure

```
lib/core/
├── config/           # Configuration files
├── constants/         # Application constants
├── utils/            # Utility functions and helpers
├── services/         # Core services
├── widgets/          # Reusable widgets
├── responsive/       # Responsive layout utilities
├── repositories/     # Data repositories
├── core.dart         # Centralized exports
└── README.md         # This file
```

## Modules

### Config (`config/`)
Contains configuration files for the application:
- `app_router.dart` - Centralized routing configuration using go_router
- `localDB.dart` - Local database configuration and utilities
- `navigation_helper.dart` - Simplified navigation interface
- `role_router.dart` - Role-based routing utilities
- `service.dart` - API service configuration

### Constants (`constants/`)
Application-wide constants:
- `app_constants.dart` - Colors, dimensions, and other app constants

### Utils (`utils/`)
Utility functions and helpers:
- `app_helpers.dart` - Common utility functions

### Services (`services/`)
Core services:
- `token_refresh_service.dart` - Authentication token management

### Widgets (`widgets/`)
Reusable UI components:
- `role_based_layout.dart` - Layout component for role-based access
- `session_management_widget.dart` - Session management UI

### Responsive (`responsive/`)
Responsive design utilities:
- `universal_responsive_layout.dart` - Universal responsive layout component

### Repositories (`repositories/`)
Data access layer:
- `appointment_repository.dart` - Appointment data operations

## Usage

### Import Everything
```dart
import 'package:a/core/core.dart';
```

### Import Specific Modules
```dart
import 'package:a/core/config/navigation_helper.dart';
import 'package:a/core/constants/app_constants.dart';
import 'package:a/core/utils/app_helpers.dart';
```

## Best Practices

1. **Keep it Clean**: Only add functionality that is truly core to the application
2. **Single Responsibility**: Each file should have a single, well-defined purpose
3. **No Dependencies**: Core modules should not depend on specific feature modules
4. **Consistent Naming**: Use clear, descriptive names for all exports
5. **Documentation**: Document all public APIs and complex logic

## Adding New Core Functionality

1. Determine the appropriate subdirectory
2. Create the file with proper documentation
3. Add the export to `core.dart`
4. Update this README if needed
5. Test thoroughly across all modules

## Dependencies

The core module has minimal external dependencies:
- `flutter/material.dart` - UI framework
- `go_router` - Navigation
- `provider` - State management
- `hive` - Local storage
- `http` - API calls

## Maintenance

- Regularly review and remove unused functionality
- Keep dependencies up to date
- Ensure all exports are actually used
- Maintain backward compatibility when possible
