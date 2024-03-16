import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/utils/utils.dart';

import '../../controllers/app_controller.dart';
import '../../widgets/responsive.dart';

class StokvelManagement extends StatefulWidget {
  const StokvelManagement({super.key});

  @override
  State<StokvelManagement> createState() => _StokvelManagementState();
}

class _StokvelManagementState extends State<StokvelManagement>
{
  final _appController = AppController.instance;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: Responsive.isMobile(context) ? 56 : 6),
              child: Text(
                _appController.activeItem.value,
                style: contentTextStyle(fontWeight: FontWeight.bold),
              )
            ),
          ],
        )),
        Expanded(
          child: ListView(
            children: const [
              
            ],
          ),
        ),
      ],
    );
  }
}