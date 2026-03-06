import 'package:coursiq/core/di/di.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppServices {
  static Future<void> init() async {
    await ScreenUtil.ensureScreenSize();
    configureDependencies();
    await dotenv.load(fileName: ".env");
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL'].toString(),
      anonKey: dotenv.env['SUPABASE_ANON_KEY'].toString(),
    );
  }
}
