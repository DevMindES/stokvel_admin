import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/controllers/member_management_controller.dart';
import 'package:stokvel_admin/controllers/message_board_controller.dart';
import 'package:stokvel_admin/pages/home.dart';
import 'package:stokvel_admin/pages/login.dart';
import 'package:stokvel_admin/utils/routes.dart';
import 'package:stokvel_admin/utils/theme_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stokvel_admin/firebase_options.dart';

import 'controllers/app_controller.dart';
import 'controllers/auth_controller.dart';
import 'pages/page_not_found.dart';
// import 'package:stokvel_admin/utils/theme_data.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  .then((firebaseApp) {
    Get.put(AppController());
    Get.put(AuthController());
    Get.put(MemberManagementController());
    Get.put(MessageBoardController());
  });

  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  final appController = AppController.instance;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: offwhite_background,
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.black),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        colorScheme: ColorScheme.fromSeed(seedColor: primary_blue),
        useMaterial3: true,
      ),
      initialRoute: rootRoute, // /
      unknownRoute: GetPage(name: '/not-found', page: () => const PageNotFound(), transition: Transition.fadeIn),
        getPages: [
          GetPage(name: rootRoute, page: () => const Home()),
          GetPage(name: loginPageRoute, page: () => const Login()),
        ],
    );
  }
}

