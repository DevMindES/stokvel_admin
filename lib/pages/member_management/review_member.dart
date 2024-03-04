import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stokvel_admin/controllers/app_controller.dart';
import 'package:stokvel_admin/utils/theme_data.dart';

import '../../utils/utils.dart';
import '../../widgets/responsive.dart';

class ReviewMember extends StatefulWidget {
  const ReviewMember({super.key});

  @override
  State<ReviewMember> createState() => _ReviewMemberState();
}

class _ReviewMemberState extends State<ReviewMember> 
{
  final _appController = AppController.instance;

  // Dummy data, replace with actual data retrieval in the future
  final String _stokvelName = 'My Stokvel';
  final String _date = '23 Jan 2024';
  final String _memberName = 'Member Name';
  final String _identificationNumber = '9901016100056';
  final String _phoneNumber = '+268 76 120 345';
  final String _email = 'email@example.com';
  final String _homeAddress = '123 Main Street';
  final String _postalCode = '12345';
  final String _city = 'New York City';
  final String _amountLoaned = 'R 670.00';
  final String _totalSubscriptions = '3';
  
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Membership Review',
                    style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 16),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            initialValue: _stokvelName,
                            decoration: InputDecoration(
                              labelText: 'Stokvel Name',
                              border: OutlineInputBorder(),
                            ),
                            readOnly: true,
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            initialValue: _date,
                            decoration: InputDecoration(
                              labelText: 'Date',
                              border: OutlineInputBorder(),
                            ),
                            readOnly: true,
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            initialValue: _memberName,
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              border: OutlineInputBorder(),
                            ),
                            readOnly: true,
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            initialValue: _identificationNumber,
                            decoration: InputDecoration(
                              labelText: 'Identification Number',
                              border: OutlineInputBorder(),
                            ),
                            readOnly: true,
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            initialValue: _phoneNumber,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(),
                            ),
                            readOnly: true,
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            initialValue: _email,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                            readOnly: true,
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            initialValue: _homeAddress,
                            decoration: InputDecoration(
                              labelText: 'Home Address',
                              border: OutlineInputBorder(),
                            ),
                            readOnly: true,
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  initialValue: _postalCode,
                                  decoration: InputDecoration(
                                    labelText: 'Postal Code',
                                    border: OutlineInputBorder(),
                                  ),
                                  readOnly: true,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  initialValue: _city,
                                  decoration: InputDecoration(
                                    labelText: 'City',
                                    border: OutlineInputBorder(),
                                  ),
                                  readOnly: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  initialValue: _amountLoaned,
                                  decoration: InputDecoration(
                                    labelText: 'Amount Loaned',
                                    border: OutlineInputBorder(),
                                  ),
                                  readOnly: true,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  initialValue: _totalSubscriptions,
                                  decoration: InputDecoration(
                                    labelText: 'Total Subscriptions',
                                    border: OutlineInputBorder(),
                                  ),
                                  readOnly: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 4,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // TODO: Handle decline action
                                  },
                                  child: const Text('Decline'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 4,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // TODO: Handle accept action
                                  },
                                  child: const Text('Accept'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                flex: 8, // Combined flex of the two buttons above
                                child: ElevatedButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text('Cancel')
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

      ],
    );
  }
}



