import 'package:flutter/material.dart';
import '../../init_packages.dart';

class DesktopDashboard extends StatelessWidget {
  const DesktopDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return appController.localNavigator();
  }
}