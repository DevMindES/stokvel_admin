import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/controllers/app_controller.dart';
import 'package:stokvel_admin/controllers/member_management_controller.dart';
import 'package:stokvel_admin/utils/routes.dart';
import 'package:stokvel_admin/utils/theme_data.dart';

import '../../utils/utils.dart';
import '../../widgets/responsive.dart';

class MemberManagement extends StatefulWidget {
  const MemberManagement({super.key});

  @override
  State<MemberManagement> createState() => _MemberManagementState();
}

class _MemberManagementState extends State<MemberManagement> 
{
  final AppController _appController = AppController.instance;
  final MemberManagementController memberManagementController = Get.find();

  @override
  Widget build(BuildContext context) {
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
          )
        ),
        
        Expanded(
          child: 
          Padding(
              padding: const EdgeInsets.all(14.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text('Total Members', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                                  Text('416', style: TextStyle(fontSize: 24.0)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text('Pending Requests', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                                  Text('3', style: TextStyle(fontSize: 24.0)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 24.0),
                      child: ElevatedButton.icon(
                        onPressed: () => AppController.instance.navigateTo(addMemberPageRoute),
                        icon: Icon(Icons.add),
                        label: Text('Add Member'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: 
                        Obx(() => DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Select Stokvel',
                                border: OutlineInputBorder(),
                              ),
                              value: memberManagementController.selectedStokvel.value?.name,
                              onChanged: (value) => value != null ? memberManagementController.onStokvelChanged(value) : null,
                              items: memberManagementController.stokvels.map((stokvel) {
                                return DropdownMenuItem<String>(
                                  value: stokvel.name,
                                  child: Text(stokvel.name),
                                );
                              }).toList(),
                            )
                          ),
                    ),
                    Obx(() => ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: memberManagementController.membersToShow.length,
                          itemBuilder: (context, index) {
                            final member = memberManagementController.membersToShow[index];
                            return Card(
                              margin: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(member.name),
                                subtitle: Text('Status: ${member.status}'),
                                trailing: member.status == 'Pending'
                                    ? ElevatedButton(
                                        onPressed: () => AppController.instance.navigateTo(reviewMemberPageRoute),
                                        child: const Text('Review Application'),
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                      )
                                    : Text('Debt: ${member.debt}'),
                              ),
                            );
                          },
                        )),
                  ],
                ),
              ),
            )
          ),
      
        ],
    );
  }
}



