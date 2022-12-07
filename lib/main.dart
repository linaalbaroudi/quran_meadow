import 'package:flutter/material.dart';
import 'package:quran_meadows/controllers/tab_manager.dart';
import 'app_theme.dart';
import 'home.dart';
import 'package:provider/provider.dart';
import './controllers/tab_manager.dart';


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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          // TODO: Add GroceryManager Provider
        ],
          child: const Home(),
      ),
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
