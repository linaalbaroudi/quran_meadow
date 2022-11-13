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
      appBar: AppBar(toolbarHeight: 50,
        title: Text(widget.course.title),
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
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  widget.course.imageUrl,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 4,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        ' Course ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 46,
                  child: Container(
                    //width: 20,
                    //height: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(102, 102, 102, 0.6),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                        //topRight: Radius.circular(15),
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

              ],
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
            onPressed: () {
              (_index != 2) ? _index++ : _index = 0;
              controller.animateTo(_index);
              setState(() {});
            },
            child: const Icon(Icons.navigate_next),
            hoverElevation: 0,
            elevation: 0,
          )
        ],
      ),
    );
  }
}
