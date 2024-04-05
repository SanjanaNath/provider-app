import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'app/controller/counter/counter_controller.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
