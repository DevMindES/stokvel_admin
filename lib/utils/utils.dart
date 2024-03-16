// CIRCULAR PROGRESS INDICATOR
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/utils/theme_data.dart';
import 'package:stokvel_admin/widgets/responsive.dart';

// screen sizes
const double largeScreenWidth = 1100.0;
const double mediumScreenWidth = 770.0;
const double smallScreenWidth = 650.0;

// double textfieldWidth = 310.0;
const double h1 = 30.0;
const double h2 = 22.0;
const double h3 = 15.0;
const double h4 = 12.0;

Widget spacer1() => const SizedBox(height: 50.0);
Widget spacer2() => const SizedBox(height: 30.0);
Widget spacer3() => const SizedBox(height: 10.0);
const double pad = 10.0;

TextStyle contentTextStyle({
  double fontSize = h3,
  FontWeight fontWeight = FontWeight.normal,
  Color fontColor = dark_fonts_grey}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: fontColor
  );
}

TextStyle smallButtonsTextStyle() {
  return const TextStyle(
    fontSize: h4,
    color: white,
    fontWeight: FontWeight.bold
  );
}

// APPBAR
AppBar appBar({required BuildContext context, required GlobalKey<ScaffoldState> key}) {
  return AppBar(
      leading: Responsive.isDesktop(context)
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Image.asset(
                    "assets/icons/funding.png",
                    width: 28,
                  ),
                ),
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => key.currentState?.openDrawer()
            ),
      title: Row(
        children: [
          Visibility(
              visible: !Responsive.isMobile(context),
              child: Text(
                'Stokvel Admin',
                style: contentTextStyle(
                  fontSize: h1,
                  fontWeight: FontWeight.bold
                )
              )
          ),
          Expanded(child: Container()),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: dark_fonts_grey,
            ),
            onPressed: () {}
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: dark_fonts_grey.withOpacity(.7),
                ),
                onPressed: () {}
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: primary_blue,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 2)
                  ),
                ),
              )
            ],
          ),
          Container(
            width: 1,
            height: 22,
            color: Colors.white,
          ),
          const SizedBox(width: 24),
          Text(
            'Admin',
            style: contentTextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 16),
          Container(
            decoration: BoxDecoration(
                color: primary_blue.withOpacity(.5),
                borderRadius: BorderRadius.circular(30)
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(30)
              ),
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              child: const CircleAvatar(
                backgroundColor: white,
                child: Icon(
                  Icons.person_outline,
                  color: dark_fonts_grey,
                ),
              ),
            ),
          )
        ],
      ),
      iconTheme: const IconThemeData(color: dark_fonts_grey),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
}
  

// CIRCULAR PROGRESS INDICATOR
Future<void> getCircularProgressIndicator() async
{
  return Get.defaultDialog(
    radius: 8.0,
    backgroundColor: Colors.white,
    barrierDismissible: false,
    title: 'Please wait',
    titleStyle: contentTextStyle(),
    titlePadding: const EdgeInsets.all(10.0),
    content: const SizedBox(
      width: 300.0,
      child: Center(
        child: CircularProgressIndicator(
          color: dark_fonts_grey,
        ),
      ),
    ),
    contentPadding: const EdgeInsets.all(20.0),
  );
}

Column retrievingData({String? message}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Center(child: CircularProgressIndicator()),
      spacer2(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message ?? 'Retrieving data...',
          textAlign: TextAlign.center,
          style: contentTextStyle(
            fontColor: primary_blue,
            fontWeight: FontWeight.bold
          ),
        ),
      )
    ],
  );
}

// widget width
double widgetWidth(BuildContext context) {

  final screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth <= mediumScreenWidth) return screenWidth * 0.90;

  return mediumScreenWidth;
}

// horizontal symmetric padding
double hsp(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth <= mediumScreenWidth) return screenWidth * 0.10;

  return screenWidth - mediumScreenWidth;
}

// G E T    D I A L O G S
const double borderRadius = 8.0;
Row _dialogHeading(String tittle) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(
        Icons.info_outline,
        size: 30.0,
      ),
      const SizedBox(width: 10.0),
      Text(
        tittle,
        style: contentTextStyle(),
      ),
    ],
  );

// ALERT DIALOG
Future<void> showMyDialog(BuildContext buildContext, title, message) async => showDialog(
      context: buildContext,
      barrierDismissible: false, // user must tap button!
      builder: (context) {
        return AlertDialog(
          icon: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: h1,
              fontWeight: FontWeight.bold,
              color: dark_fonts_grey
            )
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: h3,
                    color: dark_fonts_grey
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                'Back',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: h2,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                ),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          backgroundColor: Colors.white,
        );
      },
    );


Future<void> showGetMessageDialog(String tittle, String message)
{
  return Get.defaultDialog(
    radius: borderRadius,
    backgroundColor: Colors.white,
    barrierDismissible: false,
    title: '',
    titlePadding: const EdgeInsets.all(0.0),
    titleStyle: const TextStyle(fontSize: 0.0),
    content: Column(
      children: [
        _dialogHeading(tittle),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            style: contentTextStyle()
          ),
        ),
      ],
    ),
    contentPadding: const EdgeInsets.all(10.0),
    cancel: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Text(
              'Back',
              style: contentTextStyle(
                fontWeight: FontWeight.bold,
                fontColor: Colors.lightBlue
              ),
            ),
          )
        ],
      )
    ),
  );
}

