import 'package:flutter/material.dart';

class AppNavigator {
  final BuildContext context;

  AppNavigator(this.context);

  //? Use to push to a new route
  void pushNamed(String name, {Object? args}) {
    Navigator.of(context).pushNamed(name, arguments: args);
  }

  //? Use to replace the current route with a new route
  void replaceNamed(String name, {Object? args}) {
    Navigator.of(context).pushReplacementNamed(name, arguments: args);
  }

  //? Use to replace all routes with a new route
  void replaceAllNamed(String name, {Object? args}) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      name,
      (route) => false,
      arguments: args,
    );
  }

  //? Use to pop the current route
  void popRoute() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  //? Use to pop dialog if shown
  void popDialog() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}