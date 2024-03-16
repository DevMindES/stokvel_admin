import 'package:flutter/material.dart';
import 'package:stokvel_admin/utils/utils.dart';
import '../controllers/app_controller.dart';
import '../init_packages.dart';
import '../layout/desktop/desktop.dart';
import '../layout/mobile/mobile.dart';
import '../layout/tablet/tablet.dart';
import '../widgets/responsive.dart';
import '../widgets/side_menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appController.scaffoldKey,
      drawer: const SideMenu(),
      appBar: appBar(context: context, key: appController.scaffoldKey),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: 5, 
              child: Responsive(
                desktop: DesktopDashboard(),
                mobile: MobileDashboard(),
                tablet: TabletDashboard(),
              )
            )
          ],
        ),
      )
    );
  }
}