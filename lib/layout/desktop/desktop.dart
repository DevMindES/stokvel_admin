import 'package:flutter/material.dart';
import 'package:stokvel_admin/widgets/header.dart';

import '../../controllers/app_controller.dart';

class DesktopDashboard extends StatelessWidget {
  DesktopDashboard({super.key});

  final appController = AppController.instance;

  @override
  Widget build(BuildContext context) {
    return appController.localNavigator();
  }
}