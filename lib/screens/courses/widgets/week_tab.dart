import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../app_theme.dart';
import '../../../models/course.dart';
import '../../../models/course_week.dart';
import 'dart:math';

class WeekTab extends StatefulWidget {
  const WeekTab({Key? key, required this.week, required this.course})
      : super(key: key);

  final CourseWeek week;
  final Course course;

  @override
  State<WeekTab> createState() => _WeekTabState();
}

class _WeekTabState extends State<WeekTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child:  Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 10,
                  //offset: const Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  widget.course.imageUrl,
                  width: double.infinity,
                  //height: 150,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 200,
                  height: double.infinity,
                  padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  color: Colors.black38,
                  child: Text(
                    widget.course.title,
                    style: Theme.of(context).textTheme.headline4,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Chip(
                    backgroundColor: Colors.teal,
                    label: Text(
                      "Week ${widget.week.id}",
                      style: const TextStyle(
                        //fontSize: 20,
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
                      DateFormat.yMMMEd().format(widget.week.days[0].date),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
                const VerticalDivider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "To Date:",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      DateFormat.yMMMEd().format(widget.week.days[0].date),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.red,
          ),
        ),
        const Divider(),
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
