import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/controllers/app_controller.dart';
import 'package:stokvel_admin/controllers/message_board_controller.dart';
import 'package:stokvel_admin/utils/theme_data.dart';

import '../../utils/utils.dart';
import '../../widgets/responsive.dart';

class ViewAllMessagesPage extends StatelessWidget {
  const ViewAllMessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MessageBoardController messageBoardController = Get.find<MessageBoardController>();

    return Column(
      children: [
        Obx(() => Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: Responsive.isMobile(context) ? 56 : 6),
              child: Text(
                Get.find<AppController>().activeItem.value,
                style: contentTextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(), // Use Get.back() for navigation
          child: Text('Go Back'),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: messageBoardController.messages.map((message) => Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: message.iconColor,
                  ),
                  title: Text(message.title),
                  subtitle: Text(message.subtitle),
                  trailing: Text(message.time),
                ),
              )).toList(),
            ),
          ),
        ),
      ],
    );
  }
}