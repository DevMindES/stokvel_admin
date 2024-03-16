// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/pages/home.dart';

import '../init_packages.dart';
import '../utils/error_handling.dart';
import '../utils/utils.dart';

class AuthController extends GetxController
{
  final _auth = FirebaseAuth.instance;
  static AuthController instance = Get.find();
  Rx<User?> _user = Rx<User?>(null);
  final Rx<String> _name = "".obs;
  final Rx<String> _surname = "".obs;
  final Rx<String> _phoneNumber = "".obs;
  final Rx<String> _email = "".obs;


  String get name => _name.value;
  String get surname => _surname.value;
  String get phoneNumber => _phoneNumber.value;
  String get email => _email.value;
  String? _firestoreErrorMessage;

  Future<void> logout() async
  {
    getCircularProgressIndicator();

    try {
      await _auth.signOut();
      Get.back();
    } on Exception catch (e) {
      Get.back();
      showGetMessageDialog(
        'Error',
        e.toString()
      );
    }
  }


  Future<void> forgotPassword({required String email}) async
  {
    getCircularProgressIndicator();

    String? errorCode;
    String? errorMessage;

    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.back();
      await showGetMessageDialog(
        'Password reset info',
        'Password reset email sent. Please check your email address for further instructions.'
      );
    } on FirebaseAuthException catch (e) {
      errorCode = e.code;
    } on SocketException catch (e) { // Handle network errors
      errorCode = 'Network error';
      errorMessage = 'Please check your internet connection and try again.';
    } on Exception catch (e) { // Handle other potential errors
      // logError(e); // Log the error for debugging
      errorCode = 'Unkown error';
      errorMessage = 'An unexpected error occurred. Please try again later.';
    }

    if (errorCode != null)
    { // an error occured
      Get.back();

      if (errorMessage == null) { // it's a firebase auth exception
        Map<String, String> errorInfo = getErrorMessageFromCode(errorCode);
        await showGetMessageDialog(
          errorInfo['errorCode']!,
          errorInfo['errorMessage']!
        );
      } else { // some other error
        await showGetMessageDialog(
          errorCode,
          errorMessage
        );
      }
      
      return;
    }
  }

  
  Future<void> login({
    required String email,
    required String password}) async
  {
    getCircularProgressIndicator();

    String? errorCode;
    String? errorMessage;

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );

      _user = Rx<User?>(_auth.currentUser);
      _user.bindStream(_auth.userChanges());

      final getUserData = functions.httpsCallable("getUserData");
      final result = await getUserData.call({"uid": _user.value!.uid});

      final status = result.data["status"];

      if (status == "Error") {
        Get.back();
        await showGetMessageDialog(
          status,
          result.data["message"]
        );

        return;
      }

      Map<dynamic, dynamic> userData = result.data["message"];
      _name.value = userData["name"];
      _surname.value = userData["surname"];
      _phoneNumber.value = userData["phoneNumber"];
      _email.value = userData["email"];

      Get.back();
      Get.offAll(() => const Home());
    } on FirebaseFunctionsException catch (e) {
      errorCode = e.code;
      errorMessage = e.message;
    }
    on FirebaseAuthException catch (e) {
      errorCode = e.code;
      errorMessage = e.message;
    }
    on PlatformException catch (e) {
      errorCode = e.code;
      errorMessage = e.message;
    }
    on SocketException catch (e) { // Handle network errors
      errorCode = 'Network error';
      errorMessage = 'Please check your internet connection and try again.';
    }
    on Exception catch (e) {
      errorCode = 'unkown';
      errorMessage = 'unkown!';
    }

    Get.back();
    if (errorCode != null) {
      Map<String, String> errorInfo = getErrorMessageFromCode(errorCode!);
      await showGetMessageDialog(
        errorInfo['errorCode']!,
        errorInfo['errorMessage']!
      );
    }

  }
}