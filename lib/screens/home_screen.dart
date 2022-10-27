import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:routes_management/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //  show notification method

  Future<void> showNotification() async {
    //  android notification method

    AndroidNotificationDetails androidDetails =
        const AndroidNotificationDetails(
      'notification-youtube',
      'YouTube Notification',
      priority: Priority.max,
      importance: Importance.max,
    );

    //  ios notification method

    DarwinNotificationDetails iosDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    //

    NotificationDetails notiDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await notificationsPlugin.show(
      0,
      'Sample Notification',
      'This is a notification',
      notiDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showNotification,
        child: const Icon(Icons.notification_add),
      ),
    );
  }
}
