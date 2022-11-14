import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../models/course_week.dart';
import 'dart:math';

class WeekCard extends StatelessWidget {
  WeekCard({Key? key, required this.week}) : super(key: key);

  final CourseWeek week;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.calendar_month_rounded,
                  color: Colors.white,
                  //size: 28,
                ),
                Text(
                  "  Week ${week.id}",
                  style: AppTheme.lightTextTheme.headline5,
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Chip(
              //backgroundColor: const Color.fromRGBO(91, 91, 91, 1),
              label: Text(
                week.weekGrade.toString(),
                style: AppTheme.lightTextTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
