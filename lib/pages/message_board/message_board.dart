import 'package:flutter/material.dart';
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

  // todo: get data
  final List<Map<String, dynamic>> updates = [
    {
      'title': 'New stokvel created',
      'subtitle': 'You have been invited to join',
      'time': '1h',
      'iconColor': Colors.blue,
      'onStokvel': 'Stokvel - 9600',
    },
    {
      'title': 'Membership request received',
      'subtitle': 'Please review and respond',
      'time': '1h',
      'iconColor': Colors.blue,
      'onStokvel': 'Stokvel - 3600',
    },
    {
      'title': 'Membership request received',
      'subtitle': 'Please review and respond',
      'time': '1h',
      'iconColor': Colors.blue,
      'onStokvel': 'Stokvel - 3600',
    },
    {
      'title': 'Membership request received',
      'subtitle': 'Please review and respond',
      'time': '1h',
      'iconColor': Colors.blue,
      'onStokvel': 'Stokvel - 3600',
    },
    {
      'title': 'Membership request received',
      'subtitle': 'Please review and respond',
      'time': '1h',
      'iconColor': Colors.blue,
      'onStokvel': 'Stokvel - 1600',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // todo: Sort the updates by time in descending order 

    // Calculate the height dynamically based on the number of items to show (3)
    // Assume that each ListTile has a height of 100.0 for the calculation
    double containerHeight = (100.0 * (updates.length >= 3 ? 3 : updates.length));

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
                  // Message board section encapsulated in a Container
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: updates.take(3).map((update) => Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0), // Vertical space between cards
                        child: ListTile(
                          leading: CircleAvatar(
                            // backgroundImage: AssetImage('assets/avatar_placeholder.png'),
                            backgroundColor: update['iconColor'],
                          ),
                          title: Text(update['title']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(update['onStokvel']),
                              Text(update['subtitle']),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(update['time']),
                              SizedBox(height: 4.0),
                              Icon(Icons.circle, size: 12.0, color: update['iconColor']),
                            ],
                          ),
                          isThreeLine: true,
                        ),
                      )).toList(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextButton(
                        onPressed: () {
                          AppController.instance.navigateTo(allMessagesPageRoute);
                        },
                        child: Text('View More'),
                      ),
                    ),
                  ),
                  Card(
                      margin: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    ),
                ],
              ),
            ),
          ),


      ],
    );
  }
}
