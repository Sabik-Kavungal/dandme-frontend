import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a/viewModels/authVM.dart';
import 'package:a/config/role_router.dart';

class RoleBasedLayout extends StatefulWidget {
  const RoleBasedLayout({super.key});

  @override
  State<RoleBasedLayout> createState() => _RoleBasedLayoutState();
}

class _RoleBasedLayoutState extends State<RoleBasedLayout> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, authVM, child) {
        return RoleRouter.getDashboardByRole(authVM.userRole);
      },
    );
  }
}
