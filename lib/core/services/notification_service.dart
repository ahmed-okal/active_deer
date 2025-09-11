import 'dart:ui';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;
  bool get isInitialized => _initialized;

  Future<void> initialize() async {
    if (!_initialized) {
      await notificationsPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('notification'),
          iOS: DarwinInitializationSettings(),
        ),
      );
      _initialized = true;
      await requestPermissions();
    }
  }

  Future<void> requestPermissions() async {
    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  Future<void> showNotification(String title, String body) async {
    await initialize();
    await notificationsPlugin.show(
      0,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'channel_id',
          'channel_name',
          priority: Priority.high,
          icon: 'notification',
          color: Color(0xff000000),
          importance: Importance.max,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
    );
  }

  Future<void> cancelAllNotifications() async {
    await notificationsPlugin.cancelAll();
  }

  Future<void> cancelNotification(int id) async {
    await notificationsPlugin.cancel(id);
  }
}
