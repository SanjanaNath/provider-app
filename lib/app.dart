import 'package:flutter/material.dart';
import 'package:provider_setup/route/route_config.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RoutesConfig.router,
      title: "Go router",
    );
  }
}