import 'package:flutter/material.dart';
import '../models/course.dart';
import '../screens/weeks_gridview.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({Key? key, required this.course}) : super(key: key);
  final Course course;

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> with SingleTickerProviderStateMixin{
  // TODO: Add _sliderVal here
  late final TabController? controller;
  int _selectedIndex = 0;

  static List<Widget> pages = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      controller?.animateTo(index);
    });
  }
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, initialIndex: _selectedIndex, vsync: this);
    pages = <Widget>[
      WeeksGridView(course: widget.course),
      Icon(Icons.abc),
      Icon(Icons.abc),
    ];
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.title),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: controller,
          children: [
            WeeksGridView(course: widget.course),
            Icon(Icons.ac_unit), //todo add marks tab
            Icon(Icons.access_alarm), //todo add certificate tab
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz_rounded),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_rounded),
            label: 'Grades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars_rounded),
            label: 'certificate',
          ),
        ],
      ),
    );
  }
}
