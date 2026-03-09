import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageApp {
  static late SharedPreferences sharedPreferences;
  // static late Box<UserModel> userBox;
  static late FlutterSecureStorage storage;

  static String uuidUser = "user_uuid";
  static String userData = "user_data";

  static Future<void> initStorage() async {
    sharedPreferences = await SharedPreferences.getInstance();
    // userBox = await Hive.openBox<UserModel>("userbox");
    storage = FlutterSecureStorage();
  }

  static Future<void> setSecureStorage(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  static Future<String?>? getSecureStorage(String key) async =>
      await storage.read(key: key);

  // static setHiveData(String key, dynamic value) {
  //   userBox.put(key, value);
  // }

  // static getHiveData(String key) => userBox.get(key);

  static Future<bool> saveData(String key, dynamic value) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    return await sharedPreferences.setDouble(key, value);
  }

  static Object? getData(String key) => sharedPreferences.get(key);

  static Future<void> clearStorage() async {
    await sharedPreferences.clear();
    // await userBox.clear();
    // await userBox.compact();
    await storage.deleteAll();
    // await saveData('step', "1");
  }
}
