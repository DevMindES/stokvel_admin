import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/utils/theme_data.dart';
import 'package:stokvel_admin/utils/utils.dart';
import 'package:stokvel_admin/widgets/responsive.dart';

import '../controllers/app_controller.dart';
import '../utils/routes.dart';
import 'side_menu_item.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final appController = AppController.instance;
  
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Drawer(
      backgroundColor: primary_blue,
      child: ListView(
        children: [
          if (Responsive.isMobile(context)) Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 40),
              Row(
                children: [
                  SizedBox(width: width / 48),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Image.asset(
                      "assets/icons/funding.png",
                      width: 28,
                      height: 28
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "Stokvel Admin",
                      style: contentTextStyle(
                        fontColor: white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(width: width / 48),
                ],
              ),
              const SizedBox(height: 30),
              const Divider(color: white),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItemRoutes.map((item) => SideMenuItem(
              itemName: item.name,
              onTap: () {
                if(item.route == loginPageRoute) {
                  appController.changeActiveItemTo(dashBoardPageName);
                  Get.offAllNamed(loginPageRoute);
                }
                if (!appController.isActive(item.name)) {
                  appController.changeActiveItemTo(item.name);
                  if(Responsive.isMobile(context)) Get.back();
                  appController.navigateTo(item.route);
                }
              }
            )).toList(),
          ),
        ],
      ),
    );
  }
}