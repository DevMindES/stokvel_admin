import 'package:flutter/material.dart';

import '../../init_packages.dart';

class TabletDashboard extends StatelessWidget {
  TabletDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return appController.localNavigator();  
  }
}