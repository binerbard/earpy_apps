import 'package:intl/intl.dart';

String getCurrentDate() {
  return DateFormat('dd-MM-yyyy').format(DateTime.now());
}

String getCurrentTime() {
  return DateFormat('HH:mm:ss').format(DateTime.now());
}

String getFormattedMonthInID() {
  const List<String> months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];
  DateTime now = DateTime.now();
  return months[(now.month) - 1];
}

String getFormattedDayInID() {
  const List<String> days = [
    'Minggu',
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu'
  ];
  DateTime now = DateTime.now();
  return days[(now.weekday % 7)];
}

String getTimeStatusInID() {
  DateTime now = DateTime.now();
  int hour = now.hour;

  if (hour >= 5 && hour < 12) {
    return 'Pagi';
  } else if (hour >= 12 && hour < 15) {
    return 'Siang';
  } else if (hour >= 15 && hour < 18) {
    return 'Sore';
  } else {
    return 'Malam';
  }
}
