import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/controllers/app_controller.dart';
import 'package:stokvel_admin/utils/theme_data.dart';

import '../../utils/utils.dart';
import '../../widgets/responsive.dart';

class AddMemberPage extends StatefulWidget {
  const AddMemberPage({super.key});

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> 
{
  final _appController = AppController.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
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
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add New Member',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(height: 20),
                      
                      // Stokvel Name and Date
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Stokvel Name',
                                border: OutlineInputBorder(),
                              ),
                              items: ['Stokvel X', 'Stokvel Y', 'Stokvel Z']
                                  .map((String value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      ))
                                  .toList(),
                              onChanged: (_) {},
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Date',
                                border: OutlineInputBorder(),
                              ),
                              controller: TextEditingController(text: '23 Jan 2024'), // Example date
                              readOnly: true, // Make it read-only if the date isn't meant to be changed
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      // Full Name
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Phone Number
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 20),

                      // Email
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20),

                      // Home Address
                      TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          labelText: 'Home Address',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Postal Code and City
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _postalCodeController,
                              decoration: InputDecoration(
                                labelText: 'Postal Code',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _cityController,
                              decoration: InputDecoration(
                                labelText: 'City',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      // Identification Number
                      TextFormField(
                        controller: _idController,
                        decoration: InputDecoration(
                          labelText: 'Identification Number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Decline and Accept Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 4, 
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0), 
                              child: ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  minimumSize: Size(double.infinity, 50), 
                                ),
                                child: Text('Decline'),
                              ),
                            ),
                          ),
                          Spacer(flex: 2), 
                          Expanded(
                            flex: 4, 
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0), 
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // TODO: Handle accept action
                                  }
                                },
                                child: Text('Accept'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  minimumSize: Size(double.infinity, 50), 
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _postalCodeController.dispose();
    _cityController.dispose();
    _idController.dispose();
    super.dispose();
  }

}



