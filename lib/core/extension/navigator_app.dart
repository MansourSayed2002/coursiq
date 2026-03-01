import 'package:flutter/material.dart';

extension NavigatorApp on BuildContext {
  void push(Widget pageRoute) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => pageRoute));
  }

  void pushRepalceMent(Widget pageRoute) {
    Navigator.of(
      this,
    ).pushReplacement(MaterialPageRoute(builder: (context) => pageRoute));
  }

  void removeUntile(Widget pageRoute) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => pageRoute),
      (route) => false,
    );
  }

  void pop({Object? result}) => Navigator.of(this).pop(result);
}
