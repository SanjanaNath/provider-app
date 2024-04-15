import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_setup/route/route_config.dart';
import 'package:provider_setup/services/theme/theme_controller.dart';

import 'core/config/app_config.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    ThemeController theme = Provider.of<ThemeController>(context);
    return MaterialApp.router(
      title: AppConfig.name,

      debugShowCheckedModeBanner: false,
      // theme: AppThemes.darkTheme(context),
      themeMode: theme.themeMode,
      routeInformationParser: RoutesConfig.router.routeInformationParser,
      routerDelegate: RoutesConfig.router.routerDelegate,
      routeInformationProvider: RoutesConfig.router.routeInformationProvider,
    );
  }
}