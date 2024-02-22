import 'package:flutter/material.dart';

const double _largeScreenWidth = 1100.0;
const double _mediumScreenWidth = 768.0;
const double _smallScreenWidth = 600.0;

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < _smallScreenWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= _smallScreenWidth &&
      MediaQuery.of(context).size.width < _largeScreenWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= _largeScreenWidth;

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) return desktop;
    if (isMobile(context)) return mobile;
    return tablet;
  }
}