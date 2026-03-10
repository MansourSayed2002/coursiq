// utils/error_handler.dart
import 'package:coursiq/error_screen.dart';
import 'package:flutter/material.dart';

class AppErrorHandler {
  // Check if app is in debug mode
  static bool get inDebugMode {
    bool inDebug = false;
    assert(() {
      inDebug = true;
      return true;
    }());
    return inDebug;
  }

  // Build global error widget
  static Widget errorWidgetBuilder(FlutterErrorDetails details) {
    return ErrorScreen(
      message: inDebugMode
          ? details.exceptionAsString()
          : "An unexpected error occurred. Please try again later.",
    );
  }

  // Set this once in main.dart
  static void setupErrorHandler() {
    ErrorWidget.builder = errorWidgetBuilder;
  }
}
