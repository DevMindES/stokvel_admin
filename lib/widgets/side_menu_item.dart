// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/widgets/responsive.dart';

import '../controllers/app_controller.dart';
import '../utils/theme_data.dart';
import 'horizontal_menu_item.dart';
import 'vertical_menu_item.dart';

class SideMenuItem extends StatelessWidget
{
  final appController = AppController.instance;
  final String itemName;
  final Function() onTap;

  SideMenuItem({
    Key? key, 
    required this.itemName, 
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    if (Responsive.isDesktop(context)) return VertticalMenuItem(
      itemName: itemName,
      onTap: onTap,
    );
    
    return HorizontalMenuItem(
      itemName: itemName,
      onTap: onTap,
    );
  }
}