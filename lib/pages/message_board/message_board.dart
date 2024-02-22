import 'package:flutter/material.dart';
import 'package:stokvel_admin/utils/utils.dart';

class MessageBoard extends StatefulWidget {
  const MessageBoard({super.key});

  @override
  State<MessageBoard> createState() => _MessageBoardState();
}

class _MessageBoardState extends State<MessageBoard>
{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'MESSAGE BOARD',
        style: contentTextStyle(
          fontSize: h1,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}