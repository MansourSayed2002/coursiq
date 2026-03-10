import 'package:coursiq/core/handle_errors/app_error_handler.dart';
import 'package:coursiq/core/services/app_services.dart';
import 'package:coursiq/coursiq_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServices.init();
  AppErrorHandler.setupErrorHandler();
  runApp(const CoursiqApp());
}
