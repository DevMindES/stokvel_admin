import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/controllers/app_controller.dart';
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
    );
  }
}