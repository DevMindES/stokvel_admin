import 'package:flutter/material.dart';

const double largeScreenWidth = 1100.0;
const double mediumScreenWidth = 770.0;
const double smallScreenWidth = 650.0;

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < smallScreenWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= smallScreenWidth &&
      MediaQuery.of(context).size.width < largeScreenWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeScreenWidth;

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) return desktop;
    if (isMobile(context)) return mobile;
    return tablet;
  }
}