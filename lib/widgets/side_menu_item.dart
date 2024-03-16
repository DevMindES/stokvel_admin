// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/widgets/responsive.dart';

import '../controllers/app_controller.dart';
import '../utils/theme_data.dart';
import '../utils/utils.dart';

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
    double width = MediaQuery.of(context).size.width;
    
    return InkWell(
      onTap: onTap,
      onHover: (value) => value 
          ? appController.onHover(itemName) 
          : appController.onHover("not hovering"),
      child: Obx(() => Container(
        color: appController.isHovering(itemName) 
          ? white.withOpacity(0.1) 
          : Colors.transparent,
        child: Row(
          children: [
            Visibility(
              visible: appController.isHovering(itemName) || appController.isActive(itemName),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                width: 5,
                height: 40,
                color: white,
              ),
            ),
            SizedBox(width: width / 88),
            Padding(
              padding: const EdgeInsets.all(16),
              child: appController.returnIconFor(itemName),
            ),
            !appController.isActive(itemName) 
              ? Flexible(
                  child: Text(
                    itemName,
                    style: contentTextStyle(
                      fontColor: appController.isHovering(itemName) 
                        ? white 
                        : light_fonts_grey
                      )
                  )
                )
             : Flexible(
                child: Text(
                  itemName,
                  style:  contentTextStyle(fontColor: white)
                )
              )
          ],
        ),
      ))
    );
  }
}