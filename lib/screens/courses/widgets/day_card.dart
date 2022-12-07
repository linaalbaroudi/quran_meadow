import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../app_theme.dart';
import '../../../models/models_barrel.dart';
import 'dart:math';

class DayCard extends StatelessWidget {
  DayCard({Key? key, required this.day}) : super(key: key);

  final CourseWeekDay day;
  final Color color = colors[Random().nextInt(4)];
  static const List<Color> colors = [
    Color.fromRGBO(102, 118, 223, 1),
    Color.fromRGBO(95, 162, 186, 1),
    Color.fromRGBO(102, 102, 102, 1),
    Color.fromRGBO(175, 186, 197, 1),
    Color.fromRGBO(0, 104, 140, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        //padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.date_range_rounded,
                    color: Colors.white,
                    //size: 28,
                  ),
                  Text(
                    "   ${DateFormat('EEEE').format(day.date)}",
                    style: AppTheme.lightTextTheme.headline5,
                  ),
                ],
              ),
              Chip(
                //backgroundColor: const Color.fromRGBO(91, 91, 91, 1),
                label: Text(
                  day.dayGrade.toString(),
                  style: AppTheme.lightTextTheme.bodyText2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
