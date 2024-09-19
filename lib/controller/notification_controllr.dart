import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationController extends GetxController {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void onInit() {
    super.onInit();
    _initializeNotifications();
  }

  // Initialize local notifications
  void _initializeNotifications() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
    );

    // Initialize the plugin with the settings
    await flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  // Schedule daily notifications at a specific time
  Future<void> scheduleDailyNotification(
      int id, String title, String body) async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

    // Schedule the notification at 7:35 AM daily
    final tz.TZDateTime scheduledTime =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 7, 45, 0);

    // If the scheduled time has already passed today, schedule it for tomorrow
    final tz.TZDateTime notificationTime = scheduledTime.isBefore(now)
        ? scheduledTime.add(const Duration(days: 1))
        : scheduledTime;

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'daily_notification_channel', // Channel ID
      'Daily Notifications', // Channel Name
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    // Schedule the notification with the calculated time
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id, // Notification ID
      title, // Notification title
      body, // Notification body
      notificationTime, // Time to trigger the notification
      notificationDetails, // Notification details
      androidAllowWhileIdle:
          true, // Allow the notification even when the device is idle
      matchDateTimeComponents:
          DateTimeComponents.time, // Ensure it repeats daily at the same time
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}


// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:timezone/timezone.dart' as tz;

// class NotificationController extends GetxController {
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   @override
//   void onInit() {
//     super.onInit();
//     _initializeNotifications();
//   }

//   void _initializeNotifications() async {
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//     const AndroidInitializationSettings androidInitSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     const InitializationSettings initSettings = InitializationSettings(
//       android: androidInitSettings,
//     );

//     await flutterLocalNotificationsPlugin.initialize(initSettings);
//   }

//   Future<void> scheduleDailyNotification(
//       int id, String title, String body) async {
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     final tz.TZDateTime scheduledTime = tz.TZDateTime(
//         tz.local, now.year, now.month, now.day, 7, 35, 0); // 6:00 AM

//     final tz.TZDateTime notificationTime = scheduledTime.isBefore(now)
//         ? scheduledTime.add(const Duration(
//             days: 1)) // If the time has passed, schedule for tomorrow
//         : scheduledTime;

//     const AndroidNotificationDetails androidDetails =
//         AndroidNotificationDetails(
//       'daily_notification_channel',
//       'Daily Notifications',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     const NotificationDetails notificationDetails = NotificationDetails(
//       android: androidDetails,
//     );

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       notificationTime,
//       notificationDetails,
//       androidAllowWhileIdle: true,
//       matchDateTimeComponents: DateTimeComponents.time, // Schedule daily
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }
// }
