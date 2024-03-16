// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/utils/theme_data.dart';

import '../pages/dashboard/dashboard.dart';
import '../pages/member_management/member_management.dart';
import '../pages/message_board/message_board.dart';
import '../pages/stokvel_management/stokvel_management.dart';
import '../utils/routes.dart';
import '../utils/utils.dart';


class AppController extends GetxController
{
  static AppController instance = Get.find();

  // CLASS VARIABLES

  // widget data
  final double _neuBoxDistance = 5.0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  // menu controls
  var activeItem = dashBoardPageName.obs;
  var hoverItem = "".obs;
  

  // ROUTING
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashBoardPageRoute:
        return _getPageRoute(const DashBoard());
      case memberManagementPageRoute:
        return _getPageRoute(const MemberManagement());
      case messageBoardPageRoute:
        return _getPageRoute(const MessageBoard());
      case stokvelManagementPageName:
        return _getPageRoute(const StokvelManagement());
      default:
        return _getPageRoute(const DashBoard());
    }
  }

  PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }


  // NAVIGATION
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Future<dynamic> navigateTo(String routeName) => navigatorKey.currentState!.pushNamed(routeName);

  goBack() => navigatorKey.currentState?.pop();

  Navigator localNavigator() => Navigator(
    key: navigatorKey,
    onGenerateRoute: generateRoute,
    initialRoute: dashBoardPageRoute,
  );


  // MENU CONTROLLS
  changeActiveItemTo(String itemName) => activeItem.value = itemName;

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case dashBoardPageName:
        return _customIcon(Icons.trending_up, itemName);
      case memberManagementPageName:
        return _customIcon(Icons.people_alt_outlined, itemName);
      case messageBoardPageName:
        return _customIcon(Icons.messenger_outline_rounded, itemName);
      case stokvelManagementPageName:
        return _customIcon(Icons.people, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(
      icon, 
      size: 22, 
      color: light_fonts_grey
    );

    return Icon(
      icon,
      size: 22,
      color: isHovering(itemName) 
        ? white 
        : light_fonts_grey,
    );
  }


  //  WIDGETS

  Widget formDataField({
    required TextEditingController fieldController,
    required String lableText,
    required TextInputType textInputType,
    required double width
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      width: width,
      decoration: BoxDecoration(
        color: Colors.white, //.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {return 'Please enter some text';}
          return null;
        },
        controller: fieldController,
        style: contentTextStyle(),
        decoration: InputDecoration(
          labelText: lableText,
          labelStyle: contentTextStyle(
            fontColor: primary_blue,
            fontSize: h4
          ),
        ),
        keyboardType: textInputType,
      ),
    );
  }

  Widget neuBox({
    VoidCallback? onTap,
    Color? color,
    EdgeInsets? edgeInsets,
    required Widget child,
    required double width
  }) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(
          color: color ?? primary_blue,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            // lighter shdow on top left
            BoxShadow(
              color: Colors.white,
              offset: Offset(-_neuBoxDistance, -_neuBoxDistance),
              blurRadius: 8.0,
            ),
            // darker shdow on bottom right
            BoxShadow(
              color: Colors.grey.shade400,
              offset: Offset(_neuBoxDistance, _neuBoxDistance),
              blurRadius: 6.0
            ),
          ]
        ),
        padding: edgeInsets ?? const EdgeInsets.all(12.0),
        child: SizedBox(
          width: width,
          child: child
        ),
      ),
    );
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

}