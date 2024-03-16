import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
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
  final _functions = FirebaseFunctions.instance;
  final _appController = AppController.instance;

<<<<<<< HEAD
  Future<List<dynamic>> _getTempUsers() async 
  {
    List<dynamic>? tempUsers;

    try {
      final getTempUsers = _functions.httpsCallable("getTempUsers");
      final response = await getTempUsers.call();
      tempUsers = response.data;
    } on FirebaseFunctionsException catch (e) {
      tempUsers = [e.code, e.message, e.details];
    }

    return tempUsers!;
  }

  Future<List<dynamic>> _getUsers() async 
  {
    List<dynamic>? users;

    try {
      final getUsers = _functions.httpsCallable("getUsers");
      final response = await getUsers.call();
      users = response.data;
    } on FirebaseFunctionsException catch (e) {
      users = [e.code, e.message, e.details];
    }

    return users!;
  }

  Future<Map<dynamic, dynamic>> _createUser({required String email}) async {
    try {
      final createUser = _functions.httpsCallable("createUser");
      final response = await createUser.call({"email": email});
      return {
        "status": response.data["status"],
        "message": response.data["message"]
      };
    } on FirebaseFunctionsException catch (e) {
      return {
        "status": e.code,
        "message": e.message!,
        "details": e.details
      };
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: pad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: Responsive.isMobile(context) ? 56 : 6),
                child: Text(
                  _appController.activeItem.value,
                  textAlign: TextAlign.center,
                  style: contentTextStyle(fontWeight: FontWeight.bold),
                )
              ),
            ],
          )),
          spacer1(),
          Text(
            "Account Creation Requests",
            style: contentTextStyle(
              fontSize: h2,
              fontWeight: FontWeight.bold
            ),
          ),
          spacer2(),
           Expanded(
            child: FutureBuilder(
              future: _getTempUsers(),
              builder: (context, snapshot) 
              {
                if (snapshot.connectionState == ConnectionState.waiting) return retrievingData();
                if (snapshot.hasError) return retrievingData(message: "An error has occured while retrieving the data.");
          
                if (snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.active)
                {
                  if (snapshot.data == null) return retrievingData(message: "An error has occured while retrieving the data.");
                  if (snapshot.data!.isEmpty) return retrievingData(message: "No data to display.");
                  if (snapshot.data![0] == 'unavailable') return retrievingData(message: "It seems you have no internet connection.");
                      
                  // if (snapshot.data![0] == 'not-found') return error404(
                  //   hsp: appData.hsp,
                  //   message: snapshot.data?[1]
                  // );
          
                  return DataTable(
                    border: TableBorder.all(
                      color: white,
                      width: 2.0,
                      borderRadius: BorderRadius.circular(12.0)
                    ),
                    columns: [
                      DataColumn(label: _columnNameTextStyle(columnName: "Name")),
                      DataColumn(label: _columnNameTextStyle(columnName: "Surname")),
                      DataColumn(label: _columnNameTextStyle(columnName: "ID Number")),
                      DataColumn(label: _columnNameTextStyle(columnName: "Email")),
                      DataColumn(label: _columnNameTextStyle(columnName: "Phone Number")),
                    ],
                    rows: snapshot.data!.map((user_i) {
                      return DataRow(
                        onLongPress: () async {
                          getCircularProgressIndicator();
                          final response = await _createUser(email: user_i["email"]);
                          Get.back();

                          String message = response["details"] != null 
                          ? "${response["message"]}. \n\n${response["details"]}" 
                          : response["message"];

                          showGetMessageDialog(
                            response["status"], 
                            response["message"]
                          );
                        },
                        cells: [
                          DataCell(Text(user_i['name'])), // Access displayName
                          DataCell(Text(user_i['surname'])),
                          DataCell(Text(user_i['idNumber'])), // Access idNumber
                          DataCell(Text(user_i['email'])), // Access email
                          DataCell(Text(user_i['phoneNumber'])), // Access phoneNumber
                        ]
                      );
                    },
                  ).toList(),);
                }
          
                return retrievingData(message: "No data to display.");
                
              },
            )
          ),
          spacer1(),
          Text(
            "Existing Members",
            style: contentTextStyle(
              fontSize: h2,
              fontWeight: FontWeight.bold
            ),
          ),
          spacer2(),
           Expanded(
            child: FutureBuilder(
              future: _getUsers(),
              builder: (context, snapshot) 
              {
                if (snapshot.connectionState == ConnectionState.waiting) return retrievingData();
                if (snapshot.hasError) return retrievingData(message: "An error has occured while retrieving the data.");
          
                if (snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.active)
                {
                  if (snapshot.data == null) return retrievingData(message: "An error has occured while retrieving the data.");
                  if (snapshot.data!.isEmpty) return retrievingData(message: "No data to display.");
                  if (snapshot.data![0] == 'unavailable') return retrievingData(message: "It seems you have no internet connection.");
                      
                  // if (snapshot.data![0] == 'not-found') return error404(
                  //   hsp: appData.hsp,
                  //   message: snapshot.data?[1]
                  // );
          
                  return DataTable(
                    border: TableBorder.all(
                      color: white,
                      width: 2.0,
                      borderRadius: BorderRadius.circular(12.0)
                    ),
                    columns: [
                      DataColumn(label: _columnNameTextStyle(columnName: "Name")),
                      DataColumn(label: _columnNameTextStyle(columnName: "Surname")),
                      DataColumn(label: _columnNameTextStyle(columnName: "ID Number")),
                      DataColumn(label: _columnNameTextStyle(columnName: "Email")),
                      DataColumn(label: _columnNameTextStyle(columnName: "Phone Number")),
                    ],
                    rows: snapshot.data!.map((user_i) {
                      return DataRow(
                        onLongPress: () => print(user_i.toString()),
                        cells: [
                          DataCell(Text(user_i['name'])), // Access displayName
                          DataCell(Text(user_i['surname'])),
                          DataCell(Text(user_i['idNumber'])), // Access idNumber
                          DataCell(Text(user_i['email'])), // Access email
                          DataCell(Text(user_i['phoneNumber'])), // Access phoneNumber
                        ]
                      );
                    },
                  ).toList(),);
                }
          
                return retrievingData(message: "No data to display.");
                
              },
            )
          ),
        ],
      ),
    );
  }

  Text _columnNameTextStyle({required String columnName}) {
    return Text(
      columnName,
      overflow: TextOverflow.clip,
      style: contentTextStyle(fontWeight: FontWeight.bold),
=======
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
>>>>>>> c08873887012a571ecdfac18d0a596173c830005
    );
  }
}



