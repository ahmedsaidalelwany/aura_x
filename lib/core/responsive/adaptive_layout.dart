import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({super.key, required this.mobile, this.tablet, this.desktop});
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).largerThan(DESKTOP)) {
      return desktop ?? tablet ?? mobile;
    }
    if (ResponsiveBreakpoints.of(context).largerThan(MOBILE)) {
      return tablet ?? mobile;
    }
    return mobile;
  }
}
