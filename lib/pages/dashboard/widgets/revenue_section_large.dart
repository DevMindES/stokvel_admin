import 'package:flutter/material.dart';
import 'package:stokvel_admin/pages/dashboard/widgets/barchart.dart';
import 'package:stokvel_admin/pages/dashboard/widgets/revenue_info.dart';
import 'package:stokvel_admin/utils/theme_data.dart';
import 'package:stokvel_admin/utils/utils.dart';

class RevenueSectionLarge extends StatelessWidget {
  const RevenueSectionLarge({super.key});


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: light_fonts_grey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: light_fonts_grey, width: .5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Revenue Chart",
                  style: contentTextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    width: 600,
                    height: 200,
                    child: SimpleBarChart.withSampleData()
                  ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 120,
            color: light_fonts_grey,
          ),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    RevenueInfo(
                      title: "Toda's revenue",
                      amount: "230",
                    ),
                    RevenueInfo(
                      title: "Last 7 days",
                      amount: "1,100",
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    RevenueInfo(
                      title: "Last 30 days",
                      amount: "3,230",
                    ),
                    RevenueInfo(
                      title: "Last 12 months",
                      amount: "11,300",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}