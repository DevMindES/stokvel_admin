import 'package:flutter/material.dart';
import 'package:stokvel_admin/widgets/header.dart';

import '../../controllers/app_controller.dart';

class TabletDashboard extends StatelessWidget {
  TabletDashboard({super.key});

  final appController = AppController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      // appBar: AppBar(
      //   title: Header(pageName: pageName),
      // ),
      body: appController.localNavigator(),
    );
  }
}