import 'package:flutter/material.dart';
import 'package:quran_meadows/models/course_week.dart';
import '../models/course.dart';
import '../screens/weeks_gridview.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({Key? key, required this.course}) : super(key: key);
  final Course course;

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 3,
      initialIndex: _index,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Text(
          'Course Details',
          style: Theme.of(context).textTheme.headline1,
        ),
        bottom: TabBar(
          controller: controller,
          unselectedLabelColor: Colors.white30,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              icon: Icon(Icons.quiz_rounded),
              text: 'Tasks',
            ),
            Tab(
              icon: Icon(Icons.fact_check_rounded),
              text: 'Grades',
            ),
            Tab(
              icon: Icon(Icons.stars_rounded),
              text: 'certificate',
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
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
                      label: Row(
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
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: TabBarView(
              controller: controller,
              children: [
                WeeksGridView(course: widget.course),
                Icon(Icons.settings), //TODO: add Grades screen
                Icon(Icons.person), //TODO: add Grades screen
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton.small(
            heroTag: 'courseTabs',
            onPressed: () {
              (_index != 2) ? _index++ : _index = 0;
              controller.animateTo(_index);
              setState(() {});
            },
            hoverElevation: 0,
            elevation: 0,
            child: const Icon(Icons.navigate_next),
          )
        ],
      ),
    );
  }
}
