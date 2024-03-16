import 'package:flutter/material.dart';
import '../../init_packages.dart';

class MobileDashboard extends StatelessWidget {
  MobileDashboard({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: appController.localNavigator(),
    );
  }
}