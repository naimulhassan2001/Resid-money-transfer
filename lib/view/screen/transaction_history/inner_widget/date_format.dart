// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:intl/date_symbol_data_local.dart';
//
// class DateDisplay extends StatelessWidget {
//   DateDisplay({
//     super.key,
//     required this.date,
//   });
//
//   String date;
//
//   // int year = 2024;
//   // int month = 5;
//   // int day = 6;
//
//   @override
//   Widget build(BuildContext context) {
//     final formattedDate = _getFormattedDate();
//
//     return Text(
//       formattedDate,
//       style: TextStyle(fontSize: 20),
//     );
//   }
//
//   String _getFormattedDate() {
//
//     int year = int.parse(date.split("-")[0]) ;
//
//     var aaa = date.split("-")[1];
//
//     int month = int.parse(aaa.split("-")[0]) ;
//     var bbb = aaa.split("-")[1];
//
//     int day = int.parse(bbb.split("-")[0]) ;
//
//
//     final dateFormat = DateFormat('d MMMM, yyyy', 'en');
//     final currentDate =
//         DateTime(year, month, day); // Replace with your actual date
//     return dateFormat.format(currentDate);
//   }
// }
