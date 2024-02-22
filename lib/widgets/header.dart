import 'package:flutter/material.dart';
import 'package:stokvel_admin/utils/theme_data.dart';
import 'package:stokvel_admin/widgets/responsive.dart';

import '../controllers/app_controller.dart';

class Header extends StatelessWidget
{
  final String pageName;

  Header({super.key, required this.pageName});

  final appController = AppController.instance;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            onPressed: appController.controlMenu,
            icon: const Icon(Icons.menu, color: dark_fonts_grey),
          ),
        if (!Responsive.isMobile(context))
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(pageName),
          ),
      ],
    );
  }
}