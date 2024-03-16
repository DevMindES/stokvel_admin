import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:stokvel_admin/helpers/message.dart';


class MessageBoardController extends GetxController {
  var messages = <Message>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Here we can fetch messages from a database or initialize with static data
    // Static data initialization (replace with database fetching logic)
    loadInitialMessages();
  }

  void loadInitialMessages() {
    messages.assignAll([
      Message(
        title: 'New stokvel created',
        subtitle: 'You have been invited to join',
        time: '1h',
        iconColor: Colors.blue,
        onStokvel: 'Stokvel A - 600',
      ),
      Message(
        title: 'Membership Fees Due',
        subtitle: 'Reminder: Membership fees are due by the end of this month.',
        time: '1w ago',
        iconColor: Colors.red,
        onStokvel: 'Stokvel B - 3600',
      ),
      Message(
        title: 'Emergency Fund',
        subtitle: 'The emergency fund is now fully funded. Thank you to all contributors.',
        time: '1w ago',
        iconColor: Colors.green,
        onStokvel: 'Stokvel B - 3600',
      ),
      Message(
        title: 'Updated Stokvel Constitution',
        subtitle: 'The Stokvel constitution has been updated. Please ensure you read it.',
        time: '1m ago',
        iconColor: Colors.blue,
        onStokvel: 'Stokvel C - 3600',
      ),
      Message(
        title: 'Stokvel meet profit goal',
        subtitle: 'Please review',
        time: '12h',
        iconColor: Colors.green,
        onStokvel: 'Stokvel C - 14 400',
      ),
      Message(
        title: 'Membership request received',
        subtitle: 'Please review and respond',
        time: '1 week',
        iconColor: Colors.blue,
        onStokvel: 'Stokvel X - 1600',
      ),
      Message(
        title: 'Charity Event Success',
        subtitle: 'Our charity event was a success. We raised over \$5000!',
        time: '2w ago',
        iconColor: Colors.green,
        onStokvel: 'Stokvel X - 1600',
      ),
      // Add more messages as required
    ]);
  }

  // Add functionality to add, update, delete messages as needed
}
