import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:core';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Date Format Example'),
        ),
        body: Center(
          child: Text(
            confirmTimer("10:16:00.0000"),
            style: TextStyle(fontSize: 20, decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }

  String confirmTimer(String dateTime) {


    final parsedDate = DateTime.parse("2024-02-06T05:40:26.560Z");

    // Get the current date and time
    final currentDate = DateTime.now();

    // Calculate the difference
    final difference = currentDate.difference(parsedDate);

    // Calculate the remaining time until 10 minutes from the parsed date
    final remainingTime = Duration(minutes: 10) - difference;

    // Print the remaining time
    print('Remaining time: ${remainingTime.inMinutes} minutes and ${remainingTime.inSeconds % 60} seconds');



    return " aa";
  }
}
