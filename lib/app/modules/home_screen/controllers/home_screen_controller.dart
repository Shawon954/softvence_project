import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../service/notification_service.dart';

class HomeScreenController extends GetxController {
  var box = GetStorage();

  var alarms = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAlarms();
  }

  void loadAlarms() {
    final data = box.read<List>('alarms') ?? [];
    alarms.assignAll(data.cast<Map<String, dynamic>>());
  }

  Future<void> addAlarm(DateTime dateTime) async {
    final id = DateTime.now().millisecondsSinceEpoch.remainder(100000);

    final alarm = {
      "id": id,
      "date": DateFormat(
        'EEE, dd MMM yyyy',
      ).format(dateTime), // Mon, 07 Sep 2025
      "time": DateFormat('hh:mm a').format(dateTime), // 02:30 PM
      "active": true,
    };

    alarms.add(alarm);
    await box.write('alarms', alarms);

    NotificationService().scheduleAlarm(id, dateTime);
  }

  Future<void> toggleAlarm(int id, bool isActive) async {
    final index = alarms.indexWhere((a) => a['id'] == id);
    if (index != -1) {
      alarms[index]['active'] = isActive;
      alarms.refresh();
      await box.write('alarms', alarms);

      final dt = DateFormat(
        'EEE, dd MMM yyyy hh:mm a',
      ).parse('${alarms[index]['date']} ${alarms[index]['time']}');

      if (isActive) {
        NotificationService().scheduleAlarm(id, dt);
      } else {
        NotificationService().cancelAlarm(id);
      }
    }
  }

  Future<void> deleteAlarm(int id) async {
    alarms.removeWhere((a) => a['id'] == id);
    await box.write('alarms', alarms);
    NotificationService().cancelAlarm(id);
  }

  String formatTime(String iso) {
    final dt = DateTime.parse(iso);
    return "${DateFormat.jm().format(dt)} • ${DateFormat.yMd().format(dt)}";
  }
}
