import 'package:cloud_functions/cloud_functions.dart';
import 'package:stokvel_admin/controllers/auth_controller.dart';
import 'controllers/app_controller.dart';

final authController = AuthController.instance;
final appController = AppController.instance;
final functions = FirebaseFunctions.instance;