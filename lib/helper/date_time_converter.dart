import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class DateTimeConverter{

static  String formatDate(DateTime? date) {
  return DateFormat('dd MMM yyyy \'at\' HH:mm z').format(date!);
}



static String bangladeshTimeZone = 'America/Toronto';

// Function to convert international time to local time in Bangladesh
// static String convertToLocalTime(String internationalTime) {
//   // Parse the international time string to DateTime
//   DateTime internationalDateTime = DateTime.parse(internationalTime);
//
//   // Convert to the Bangladesh timezone
//   tz.TZDateTime bangladeshDateTime = tz.TZDateTime.from(
//       internationalDateTime, tz.getLocation(bangladeshTimeZone));
//
//   // Format the local time
//   return bangladeshDateTime.toString();
// }

static  String convertToLocalTime(DateTime time) {
  var locations = tz.timeZoneDatabase.locations;
  print(locations.length); // => 429
  print(locations.keys.first); // => "Africa/Abidjan"
  print(locations.keys.last);
    // Convert to the Bangladesh timezone
    tz.TZDateTime bangladeshDateTime = tz.TZDateTime.from(
        time, tz.getLocation(locations.keys.first));
    // Format the local time
  String formattedDateTime =
  DateFormat('dd MMM yyyy \'at\' HH:mm z').format(bangladeshDateTime);

  return formattedDateTime;
  }

 static String getTimeZone(DateTime dateTime) {
    tz.Location? timeZone = tz.getLocation(dateTime.timeZoneName);
    return timeZone.name ?? 'Unknown';
  }


 static String convertUtcToLocal(DateTime? utcDateTime) {

    DateTime localDateTime = utcDateTime!.toLocal();
    // return DateFormat.yMMMd().add_jm().format(localDateTime);

    return DateFormat('dd MMM yyyy \'At\' HH:mm z').format(localDateTime);
 }



}