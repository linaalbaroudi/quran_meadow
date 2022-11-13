import 'package:flutter/material.dart';
import '../models/course.dart';
import '../widgets/week_card.dart';
import '../screens/week_details.dart';

class WeeksGridView extends StatelessWidget {
  const WeeksGridView({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 5/3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15),
      //shrinkWrap: true,
      children: course.level.weeks.map((week) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WeekDetails(courseWeek: week, course: course,);
            }));
          },
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
            child: WeekCard(week: week),
        );
      }).toList(),
    );
  }
}
