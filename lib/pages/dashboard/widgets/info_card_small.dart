import 'package:flutter/material.dart';
import 'package:stokvel_admin/utils/theme_data.dart';
import 'package:stokvel_admin/utils/utils.dart';

class InfoCardSmall extends StatelessWidget {
  final String title;
  final String value;
  final bool isActive;
  final Function() onTap;

  const InfoCardSmall({
    Key? key,
    required this.title,
    required this.value,
    this.isActive = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: isActive ? primary_blue : light_fonts_grey, width: .5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: contentTextStyle(
                    fontColor: isActive ? primary_blue : light_fonts_grey,
                  ),
                ),
                Text(
                  value,
                  style: contentTextStyle(
                    fontWeight: FontWeight.bold,
                    fontColor: isActive ? primary_blue : dark_fonts_grey,
                  ),
                )
              ],
            )),
      ),
    );
  }
}