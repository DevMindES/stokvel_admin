import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/controllers/app_controller.dart';
import 'package:stokvel_admin/pages/dashboard/widgets/revenue_section_large.dart';
import 'package:stokvel_admin/pages/dashboard/widgets/revenue_section_small.dart';
import 'package:stokvel_admin/utils/utils.dart';
import 'package:stokvel_admin/widgets/responsive.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
{
  final appController = AppController.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: Responsive.isMobile(context) ? 56 : 6),
              child: Text(
                appController.activeItem.value,
                style: contentTextStyle(fontWeight: FontWeight.bold),
              )
            ),
          ],
        )),
        Expanded(
          child: ListView(
            children: [
              if (!Responsive.isMobile(context)) const RevenueSectionLarge() else const RevenueSectionSmall(),
              // const AvailableDriversTable(),
            ],
          ),
        ),
      ],
    );
  }
}