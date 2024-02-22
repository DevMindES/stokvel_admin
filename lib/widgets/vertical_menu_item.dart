import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/controllers/app_controller.dart';
import 'package:stokvel_admin/utils/theme_data.dart';
import 'package:stokvel_admin/utils/utils.dart';

class VertticalMenuItem extends StatelessWidget
{
  final String itemName;
  final Function()? onTap;

  const VertticalMenuItem({
    Key? key, 
    required this.itemName, 
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    final appController = AppController.instance;
    
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
          ? appController.onHover(itemName)
          : appController.onHover("not hovering");
      },
      child: Obx(() => Container(
        color: appController.isHovering(itemName)
            ? light_fonts_grey.withOpacity(.1)
            : Colors.transparent,
        child: Row(
          children: [
            Visibility(
              visible: appController.isHovering(itemName) || appController.isActive(itemName),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                width: 3,
                height: 72,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: appController.returnIconFor(itemName),
                  ),
                  if(!appController.isActive(itemName)) Flexible(
                    child: Text(
                      itemName,
                      style: contentTextStyle(fontColor: appController.isHovering(itemName) ? Colors.white : light_fonts_grey)
                    )
                  )
                  else Flexible(
                    child: Text(
                      itemName,
                      style:  contentTextStyle(
                        fontColor: Colors.white,
                        fontWeight: FontWeight.bold
                      )
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      )));
  }
}