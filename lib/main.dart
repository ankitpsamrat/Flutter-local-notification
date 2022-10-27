import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:routes_management/screens/home_screen.dart';

//  globle variable

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  android setting

  AndroidInitializationSettings androidSettings =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  //  ios setting

  DarwinInitializationSettings iosSettings = const DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestCriticalPermission: true,
    requestSoundPermission: true,
  );

  //  initialize all setting

  InitializationSettings initializationSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );

  bool? initialized =
      await notificationsPlugin.initialize(initializationSettings);

  log('Notifications: $initialized');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local notifications',
      home: HomeScreen(),
    );
  }
}
