import 'package:earpy_app/datasources/models/request/moodreqmodel.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

String getCurrentDate() => DateFormat('dd-MM-yyyy').format(DateTime.now());

String getCurrentTime() => DateFormat('HH:mm:ss').format(DateTime.now());

String getFormattedMonthInID(DateTime dateTime) {
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
  return months[dateTime.month - 1];
}

String getFormattedDayInID(DateTime dateTime) {
  const List<String> days = [
    'Minggu',
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu'
  ];
  return days[dateTime.weekday % 7];
}

String getTimeStatusInID(DateTime dateTime) {
  final int hour = dateTime.hour;

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

List<MoodTrackReqModel> getDatesForMood(int month, int year) {
  final firstDayOfMonth = DateTime(year, month, 1);
  final lastDayOfMonth =
      DateTime(year, month + 1).subtract(const Duration(days: 1));
  final difference = lastDayOfMonth.difference(firstDayOfMonth).inDays + 1;
  const uuid = Uuid();

  return List<MoodTrackReqModel>.generate(difference, (index) {
    final date = DateFormat('yyyy-MM-dd')
        .format(firstDayOfMonth.add(Duration(days: index)));
    final number = date.split('-').last;
    return MoodTrackReqModel(
      id: uuid.v4(),
      number: number,
      date: date,
      emoji: null,
      content: null,
    );
  });
}
