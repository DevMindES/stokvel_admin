import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/controllers/app_controller.dart';
import 'package:stokvel_admin/utils/theme_data.dart';

import '../../utils/utils.dart';
import '../../widgets/responsive.dart';

class ViewAllMessagesPage extends StatefulWidget {
  const ViewAllMessagesPage({super.key});

  @override
  State<ViewAllMessagesPage> createState() => _ViewAllMessagesPageState();
}

class _ViewAllMessagesPageState extends State<ViewAllMessagesPage> 
{
  final _appController = AppController.instance;

  List<Map<String, dynamic>> updates = [
    {
      'title': 'Annual General Meeting',
      'subtitle': 'Scheduled for 3rd Dec. All members are requested to attend.',
      'time': '2d ago',
      'iconColor': Colors.green,
    },
    {
      'title': 'New Loan Policy',
      'subtitle': 'The loan policy has been updated. Please review the changes.',
      'time': '5d ago',
      'iconColor': Colors.blue,
    },
    {
      'title': 'Membership Fees Due',
      'subtitle': 'Reminder: Membership fees are due by the end of this month.',
      'time': '1w ago',
      'iconColor': Colors.red,
    },
    {
      'title': 'Emergency Fund',
      'subtitle': 'The emergency fund is now fully funded. Thank you to all contributors.',
      'time': '1w ago',
      'iconColor': Colors.green,
    },
    {
      'title': 'Charity Event Success',
      'subtitle': 'Our charity event was a success. We raised over \$5000!',
      'time': '2w ago',
      'iconColor': Colors.green,
    },
    {
      'title': 'New Member Welcome',
      'subtitle': 'Welcome to our 5 new members who joined this month.',
      'time': '3w ago',
      'iconColor': Colors.blue,
    },
    {
      'title': 'Updated Stokvel Constitution',
      'subtitle': 'The Stokvel constitution has been updated. Please ensure you read it.',
      'time': '1m ago',
      'iconColor': Colors.blue,
    },
  ];

  
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
          child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(), // Adjust as needed
                  child: Text('Go Back'),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...updates.map((update) => Card(
                          margin: EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: update['iconColor'],
                            ),
                            title: Text(update['title']),
                            subtitle: Text(update['subtitle']),
                            trailing: Text(update['time']),
                          ),
                        )).toList(),
                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
        

        
      ],
    );
  }
}



