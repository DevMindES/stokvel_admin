import 'package:flutter/material.dart';
import 'package:stokvel_admin/utils/utils.dart';

class StokvelManagement extends StatefulWidget {
  const StokvelManagement({super.key});

  @override
  State<StokvelManagement> createState() => _StokvelManagementState();
}

class _StokvelManagementState extends State<StokvelManagement>
{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'STOKVEL MANAGEMENT',
        style: contentTextStyle(
          fontSize: h1,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}