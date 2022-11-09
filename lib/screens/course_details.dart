import 'package:flutter/material.dart';
import '../models/course.dart';
import '../widgets/week_card.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({Key? key, required this.course}) : super(key: key);
  final Course course;

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  // TODO: Add _sliderVal here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 185,
              //width: 370,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    widget.course.imageUrl,
                    width: double.infinity,
                    height: 185,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 4,
                    left: 0,
                    child: Container(
                      //width: 20,
                      //height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(102,102,102, 0),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: const Text(
                        ' Course ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 44,
                    left: 0,
                    child: Container(
                      //width: 20,
                      //height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(102,102,102, 0.6),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.layers,
                            color: Colors.white, //todo add theme
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            'level: ',
                            style: TextStyle(
                                //fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.course.level.id.toString(),
                            style: const TextStyle(
                                //fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      //width: 20,
                      //height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(102,102,102, 0.7),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.person,
                            color: Colors.white, //todo add theme
                          ),
                          Text(
                            //todo: make it dynamic
                            ' Lina Albaroudi',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // todo: add tabs to display tasks, marks, and course certificate
            // TODO: Add Expanded
            Expanded(
              child: GridView(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 4 / 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                children: widget.course.level.weeks.map((week) {
                  return WeekCard(week: week);
                }).toList(),
              ),
            ),
            // TODO: Add Slider() here
          ],
        ),
      ),
    );
  }
}
