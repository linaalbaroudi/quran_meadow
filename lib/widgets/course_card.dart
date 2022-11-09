import 'package:flutter/material.dart';
import '../models/course.dart';
import '../app_theme.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: 235,
            child: Column(
              children: [
                SizedBox(
                  height: 185,
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.asset(
                          course.imageUrl,
                          width: double.infinity,
                          height: 185,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: 200,
                        height: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        decoration: const BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15))),
                        child: Text(
                          course.title,
                          style: AppTheme.lightTextTheme.headline2,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.school_rounded,
                          color: Colors.teal, //todo add theme
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          course.institute,
                          style: AppTheme.lightTextTheme.bodyText1,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.layers,
                          color: Colors.teal, //todo add theme
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Level: ",
                          style: AppTheme.lightTextTheme.headline3,
                        ),
                        Text(
                          course.level.id.toString(),
                          style: AppTheme.lightTextTheme.bodyText2,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}
