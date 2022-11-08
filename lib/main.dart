import 'package:flutter/material.dart';
import 'models/course.dart';
import 'views/course_details.dart';

void main() {
  runApp(const QuranMeadows());
}

class QuranMeadows extends StatelessWidget {
  const QuranMeadows({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Quran Meadows',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(primary: Colors.purple, secondary: Colors.teal)),
      home: const MyHomePage(title: 'Quran Meadows'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: ListView.builder(
              itemCount: Course.samples.length,
              itemBuilder: (BuildContext context, int index) {

                return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          // TODO: Replace return with return RecipeDetail()
                          return CourseDetails(course: Course.samples[index]);
                        })
                      );
                    },
                    child: buildCourseCard(Course.samples[index]));
              }),
        ),
        );
  }

  Widget buildCourseCard(Course course) {
    return Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image(
                image: AssetImage(course.imageUrl),
              ),
              const SizedBox(
                height: 14.0,
              ),
              Text(course.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Palatino',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ));
  }
}
