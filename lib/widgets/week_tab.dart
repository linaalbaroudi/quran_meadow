import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../app_theme.dart';
import '../models/course.dart';
import '../models/course_week.dart';
import 'dart:math';

class WeekTab extends StatelessWidget {
  const WeekTab({Key? key, required this.week, required this.course}) : super(key: key);

  final CourseWeek week;
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Stack(
            children: <Widget>[
              Image.asset(
                course.imageUrl,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 20,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      ' Course ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 4,
                left: 40,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Week ${week.id.toString()}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "From Date:",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      DateFormat.yMMMEd().format(week.days[0].date),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "To Date:",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      DateFormat.yMMMEd().format(week.days[0].date),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
