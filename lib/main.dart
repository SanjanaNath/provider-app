import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_setup/services/database/local_database.dart';
import 'package:provider_setup/services/theme/theme_controller.dart';
import 'app.dart';
import 'app/controller/counter/counter_controller.dart';
import 'app/controller/dashboard/dashboard_controller.dart';


Future main() async {
  await LocalDatabase.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterController()),
        ChangeNotifierProvider(create: (context) => DashboardController()),
        ChangeNotifierProvider(create: (context) => ThemeController()),
      ],
      child: const MyApp(),
    ),
  );
}
