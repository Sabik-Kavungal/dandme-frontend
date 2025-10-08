import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:a/core/config/role_router.dart';

class RoleBasedLayout extends StatefulWidget {
  const RoleBasedLayout({super.key});

  @override
  State<RoleBasedLayout> createState() => _RoleBasedLayoutState();
}

class _RoleBasedLayoutState extends State<RoleBasedLayout> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, AuthViewModel, child) {
        return RoleRouter.getDashboardByRole(AuthViewModel.userRole);
      },
    );
  }
}
