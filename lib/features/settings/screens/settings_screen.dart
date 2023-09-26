import 'package:flutter/material.dart';

import '../../../widgets/height_space.dart';
import '../widgets/settings_card.dart';
import 'change_admin_auth_pin_screen.dart';
import 'create_admin_screen.dart';
import 'delete_admin_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const HeightSpace(15),
            SettingsCard(
                icon: Icons.person,
                settingsOperation: "Create Admin",
                settingsOperationDescription: "Create a new admin or agent",
                onPressed: () {
                  Navigator.pushNamed(context, CreateAdminScreen.route);
                }),
            const HeightSpace(15),
            SettingsCard(
                icon: Icons.delete,
                settingsOperation: "Delete Admin Or User",
                settingsOperationDescription:
                    "Delete an existing admin or agent or user",
                onPressed: () {
                  Navigator.pushNamed(context, DeleteAdminScreen.route);
                }),
            const HeightSpace(15),
            SettingsCard(
                icon: Icons.password,
                settingsOperation: "Change Authorization Pin",
                settingsOperationDescription:
                    "Change the authorizatin pin for approving sensitive requests",
                onPressed: () {
                  Navigator.pushNamed(context, ChangeAdminAuthScreen.route);
                })
          ],
        ),
      ),
    );
  }
}
