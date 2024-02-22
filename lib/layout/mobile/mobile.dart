import 'package:flutter/material.dart';
import 'package:stokvel_admin/widgets/header.dart';

import '../../controllers/app_controller.dart';

class MobileDashboard extends StatelessWidget {
  MobileDashboard({super.key});

  final appController = AppController.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: appController.localNavigator(),
    );
  }
}