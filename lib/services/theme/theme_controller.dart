import 'package:flutter/material.dart';
import 'package:provider_setup/core/extensions/nullsafe/null_safe_list_extentions.dart';


import '../../core/config/app_fonts.dart';
import '../../core/constant/colors.dart';
import '../../utils/widgets/custom_bottom_sheet.dart';
import '../database/local_database.dart';
import 'theme_picker.dart';

class ThemeController with ChangeNotifier {
  /// Theme...

  ThemeMode localTheme() {
    ThemeMode? themeMode;
    List<ThemeMode> list =
        ThemeMode.values.where((element) => element.name == LocalDatabase().themeMode).toList();
    if (list.haveData) {
      themeMode = list.first;
    }

    return themeMode ?? ThemeMode.system;
  }

  late ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  void changeTheme({required ThemeMode themeMode}) {
    _themeMode = themeMode;
    LocalDatabase().setThemeMode(mode: _themeMode);
    notifyListeners();
  }

  showThemePicker({required BuildContext context}) {
    return CustomBottomSheet.show(
      context: context,
      title: 'Change Theme',
      centerTitle: true,
      body: const ThemePicker(),
    );
  }
}

class AppThemes {
  ///1) Dark Theme...
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      useMaterial3: false,
      canvasColor: Colors.transparent,
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent, elevation: 0),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.transparent),

      dividerTheme: const DividerThemeData(color: Colors.white, thickness: 1),
      textTheme: const TextTheme(),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: createMaterialColor(primaryColor),
        brightness: Brightness.dark,
      ),
      fontFamily: AppFonts.tomatoGrotesk,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontFamily: AppFonts.tomatoGrotesk,
          fontWeight: FontWeight.w700,
        ),
      ),
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: backgroundColor,
        headerBackgroundColor: primaryColor,
      ),
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: backgroundColor,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
