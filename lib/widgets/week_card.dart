import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../models/course_week.dart';
import '../screens/week_details.dart';
import 'dart:math';

class WeekCard extends StatelessWidget {
  WeekCard({Key? key, required this.week}) : super(key: key);

  final CourseWeek week;
  final Color color = colors[Random().nextInt(7)];
  static const List<Color> colors = [
    Color.fromRGBO(0,118,223,1),
    Color.fromRGBO(95,162,186,1),
    Color.fromRGBO(102,102,102,1),
    Color.fromRGBO(133,78,155,1),
    Color.fromRGBO(202,88,157,1),
    Color.fromRGBO(175,186,197,1),
    Color.fromRGBO(0,104,140,1),
  ];

  void selectWeek(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeekDetails();
    }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WeekDetails();
        }));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Icon(
                Icons.calendar_month_rounded,
                color: Colors.white,
                size: 30,
              ),
              Text(
                "Week ${week.id}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(91, 91, 91, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    week.weekGrade.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
