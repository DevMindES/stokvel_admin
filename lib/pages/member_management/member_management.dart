import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/controllers/app_controller.dart';
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
  final _appController = AppController.instance;

  String selectedStokvel = 'Stokvel A';
  List<Map<String, String>> membersToShow = [];

  Map<String, List<Map<String, String>>> stokvelMembers = {
    'Stokvel A': [
      {'name': 'Member 1', 'status': 'Active', 'debt': '100'},
      {'name': 'Member 2', 'status': 'Pending', 'debt': ''},
      {'name': 'Member 3', 'status': 'Active', 'debt': '300'},
    ],
    'Stokvel B': [
      {'name': 'Member 1', 'status': 'Active', 'debt': '150'},
      {'name': 'Member 2', 'status': 'Active', 'debt': '200'},
      {'name': 'Member 3', 'status': 'Active', 'debt': '250'},
      {'name': 'Member 4', 'status': 'Active', 'debt': '350'},
    ],
    'Stokvel C': [
      {'name': 'Member 1', 'status': 'Active', 'debt': '120'},
      {'name': 'Member 2', 'status': 'Pending', 'debt': ''},
      {'name': 'Member 3', 'status': 'Active', 'debt': '220'},
      {'name': 'Member 4', 'status': 'Active', 'debt': '320'},
      {'name': 'Member 5', 'status': 'Pending', 'debt': ''},
    ],
  };
        

  @override
  void initState() {
    super.initState();
    // Initially populate the membersToShow with Stokvel A's members
    membersToShow = stokvelMembers[selectedStokvel]!;
  }

  void onStokvelChanged(String? stokvel) {
    if (stokvel != null) {
      setState(() {
        selectedStokvel = stokvel;
        membersToShow = stokvelMembers[selectedStokvel]!;
      });
    }
  }
  
  
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
                child: StatefulBuilder(  // Using StatefulBuilder to manage local state.
                  builder: (BuildContext context, StateSetter setState) {
            
            
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top Info Cards
                        const Padding(
                          padding: EdgeInsets.all(8.0),
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
                        // Green Add Member Button
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 24.0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              AppController.instance.navigateTo(addMemberPageRoute);
                            },
                            icon: Icon(Icons.add),
                            label: Text('Add Member'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, // Background color
                              foregroundColor: Colors.white, // Text Color (Foreground color)
                            ),
                          ),
                        ),
                        
                        // Dropdown for selecting Stokvel
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Select Stokvel',
                              border: OutlineInputBorder(),
                            ),
                            value: selectedStokvel,
                            items: stokvelMembers.keys.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: onStokvelChanged, // Update the displayed members based on selection
                          ),
                        ),
                        
                        // Member List
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: membersToShow.length,
                          itemBuilder: (BuildContext context, int index) {
                            final member = membersToShow[index];
                            return Card(
                              margin: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text('${member['name']}'),
                                subtitle: Text('Status: ${member['status']}'),
                                trailing: member['status'] == 'Pending'
                                  ? ElevatedButton(
                                      onPressed: () {
                                        AppController.instance.navigateTo(reviewMemberPageRoute);
                                      },
                                      child: const Text('Review Application'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                    )
                                  : Text('Debt: ${member['debt']}'),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),


      ],
    );
  }
}



