import 'dart:io';

import 'package:bitroot_org/common_models/user_data.dart';
import 'package:bitroot_org/common_provider/app_state.dart';
import 'package:bitroot_org/modules/dashboard/providers/dashboard_providers.dart';
import 'package:bitroot_org/modules/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'services/hive_setup.dart';

Future<void> main() async {
  final document = Directory.current.path;
  Hive.init(document);
  Hive.registerAdapter(UserAdapter());
  await HiveBox.initBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
