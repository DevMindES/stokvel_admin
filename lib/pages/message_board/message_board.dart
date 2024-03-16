import 'package:flutter/material.dart';
import 'package:stokvel_admin/controllers/message_board_controller.dart';
import 'package:stokvel_admin/utils/routes.dart';
import 'package:stokvel_admin/utils/utils.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/controllers/app_controller.dart';
import 'package:stokvel_admin/utils/theme_data.dart';

import '../../widgets/responsive.dart';

class MessageBoard extends StatefulWidget {
  const MessageBoard({super.key});

  @override
  State<MessageBoard> createState() => _MessageBoardState();
}

class _MessageBoardState extends State<MessageBoard>
{
  final _appController = AppController.instance;
  final MessageBoardController messageBoardController = Get.find(); // Get the controller instance


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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(() => Padding(padding: EdgeInsets.all(14.0),
                    child: Container(
                      padding: const EdgeInsets.all(18.0),
                      alignment: Alignment.center,
                      child: Column(
                        children: messageBoardController.messages.take(3).map((message) => Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0), // Vertical space between cards
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: message.iconColor,
                            ),
                            title: Text(message.title),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(message.onStokvel),
                                Text(message.subtitle),
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(message.time),
                                SizedBox(height: 4.0),
                                Icon(Icons.circle, size: 12.0, color: message.iconColor),
                              ],
                            ),
                            isThreeLine: true,
                          ),
                        )).toList(),
                      ),
                    ),
                  )),
                  
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 14.0),
                      child: TextButton(
                        onPressed: () {
                          AppController.instance.navigateTo(allMessagesPageRoute);
                        },
                        child: Text('View More'),
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:
                      Card(
                        margin: const EdgeInsets.all(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // DropdownButtonFormField<String>(
                              //   hint: Text('Type: Announcement, Income, Loan, etc.'),
                            //   items: <String>['Announcement', 'Income', 'Loan', 'Other'].map((String value) {
                            //     return DropdownMenuItem<String>(
                            //       value: value,
                            //       child: Text(value),
                            //     );
                            //   }).toList(),
                            //   onChanged: (_) {
                            //     // TODO: Handle change
                            //   },
                            // ),
                            SizedBox(height: 8.0),
                            DropdownButtonFormField<String>(
                              hint: Text('Stokvels: All, Stokvel ABC, etc.'),
                              items: <String>['All', 'Stokvel ABC', 'Stokvel XYZ', 'Other'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {
                                // TODO: Handle change
                              },
                            ),
                            SizedBox(height: 8.0),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Message/Update',
                                border: OutlineInputBorder(),
                              ),
                              minLines: 3,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                            SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () {
                                // TODO: Implement send message functionality
                              },
                              child: Text('Add'),
                            ),
                          ],
                        ),
                      ),
                    )
                  )
                  ],
              ),
            ),
          ),


      ],
    );
  }
}
