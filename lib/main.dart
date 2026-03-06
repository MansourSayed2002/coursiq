import 'package:coursiq/core/services/app_services.dart';
import 'package:coursiq/coursiq_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServices.init();
  runApp(const CoursiqApp());
}
