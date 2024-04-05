import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../core/config/app_config.dart';
import '../../app/model/auth/user_data.dart';


class LocalDatabase extends ChangeNotifier {
  ///Hive Database Initialization....

  static Future initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserDataAdapter());
    await Hive.openBox(AppConfig.databaseName);
  }

  ///Hive Database Box....
  Box database = Hive.box(AppConfig.databaseName);

  Future clearDatabase() async {
    await database.clear().then((value) {
      user = null;
      notifyListeners();
    });
  }

  ///Access Local Database data...

  late String? user = database.get('user');
  late String? route = database.get('route');
  late String? deviceToken = database.get('deviceToken');
  late String? accessToken = database.get('accessToken');
  late String? themeMode = database.get('themeMode');

  ///Setting Local Database data...

  // Future saveUserData({required UserData? user}) async {
  //   this.user = user;
  //   database.put('user', user);
  //   debugPrint('user fullName ${user?.fullName}');
  //   notifyListeners();
  // }

  setDeviceToken(String? token) {
    deviceToken = token;
    database.put('deviceToken', token ?? '');
    notifyListeners();
  }

  setAccessToken(String? token) {
    accessToken = token;
    database.put('accessToken', token ?? '');
    notifyListeners();
  }

  setThemeMode({required ThemeMode mode}) {
    themeMode = mode.name;
    database.put('themeMode', themeMode ?? '');
    notifyListeners();
  }

  setRoute({required String route}) {
    this.route = route;
    database.put('route', route ?? '');
    notifyListeners();
  }
}
