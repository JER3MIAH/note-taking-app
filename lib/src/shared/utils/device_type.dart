import 'package:flutter/material.dart';

class DeviceType {
  final BuildContext context;

  DeviceType(this.context);

  bool get isMobile => MediaQuery.of(context).size.width < 600;

  bool get isTablet => MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1200;

  bool get isDesktop => MediaQuery.of(context).size.width >= 1200;
}