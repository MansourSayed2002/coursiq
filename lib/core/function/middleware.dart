import 'package:coursiq/core/helper/local_storage.dart';
import 'package:coursiq/features/auth/presentation/screen/login_screen.dart';
import 'package:coursiq/features/main/main_screen.dart';
import 'package:flutter/widgets.dart';

Widget middleWare() {
  if (LocalStorageApp.getData("step") == "1") {
    return MainScreen();
  } else {
    return LoginScreen();
  }
}
