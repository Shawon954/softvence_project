import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin notifications =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tz.initializeTimeZones();

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS initialization
    const ios = DarwinInitializationSettings();

    // Initialization settings
    const settings = InitializationSettings(android: android, iOS: ios);

    await notifications.initialize(settings);
  }

  /// Schedule an alarm at a given time
  Future<void> scheduleAlarm(int id, DateTime time) async {
    await notifications.zonedSchedule(
      id,
      "Alarm",
      "Time to relax 🌿",
      tz.TZDateTime.from(time, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "alarm_channel",
          "Alarms",
          channelDescription: "Alarm notifications",
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        ),
        //iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.alarmClock,

      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  /// Cancel a specific alarm
  Future<void> cancelAlarm(int id) async {
    await notifications.cancel(id);
  }

  /// Cancel all alarms
  Future<void> cancelAll() async {
    await notifications.cancelAll();
  }
}
