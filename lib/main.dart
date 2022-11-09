import 'package:flutter/material.dart';
import 'models/course.dart';
import 'widgets/course_card.dart';
import 'screens/course_details.dart';
import 'app_theme.dart';
import 'home.dart';

void main() {
  runApp(const QuranMeadows());
}

class QuranMeadows extends StatelessWidget {
  const QuranMeadows({super.key});

  // TODO: Create theme
  // TODO: Apply Home widget

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = AppTheme.light(); // TODO: Add theme

    return MaterialApp(
      theme: theme,
      title: 'Quran Meadows',
      home: const Home(),
    );

    // return MaterialApp(
    //   title: 'Quran Meadows',
    //   theme: theme,
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text(
    //           'Courses',
    //         style: theme.textTheme.headline1,
    //       ),
    //     ),
    //     // TODO: Style the body text
    //     body: SafeArea(
    //       child: ListView.builder(
    //           itemCount: Course.samples.length,
    //           itemBuilder: (BuildContext context, int index) {
    //             return GestureDetector(
    //                 onTap: () {
    //                   Navigator.push(context,
    //                       MaterialPageRoute(builder: (context) {
    //                     return CourseDetails(course: Course.samples[index]);
    //                   }));
    //                 },
    //                 child: CourseCard(course: Course.samples[index]));
    //           }),
    //     ),
    //   ),
    // );
  }
}
