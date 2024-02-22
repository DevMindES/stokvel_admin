import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/controllers/app_controller.dart';
import 'package:stokvel_admin/utils/theme_data.dart';
import 'package:stokvel_admin/utils/utils.dart';

class HorizontalMenuItem extends StatelessWidget
{
  final String itemName;
  final Function()? onTap;
  const HorizontalMenuItem({ Key? key,required this.itemName, this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    final appController = AppController.instance;
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      onHover: (value){
        value 
          ? appController.onHover(itemName) 
          : appController.onHover("not hovering");
      },
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
            SizedBox(width:width / 88),
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