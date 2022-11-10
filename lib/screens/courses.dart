import 'package:flutter/material.dart';
import '../models/course.dart';
import '../widgets/course_card.dart';
import 'course_details.dart';

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Course.samples.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CourseDetails(course: Course.samples[index]);
                }));
              },
              child: CourseCard(course: Course.samples[index]));
        });
  }
}