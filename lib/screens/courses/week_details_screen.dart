import 'package:flutter/material.dart';
import 'package:quran_meadows/screens/courses/widgets/week_tab.dart';
import '../../models/course.dart';
import '../../models/course_week.dart';

class WeekDetails extends StatefulWidget {
  const WeekDetails({Key? key, required this.courseWeek, required this.course})
      : super(key: key);

  final CourseWeek courseWeek;
  final Course course;

  @override
  State<WeekDetails> createState() => _WeekDetailsState();
}

class _WeekDetailsState extends State<WeekDetails> with SingleTickerProviderStateMixin {

  late final TabController controller;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _index = widget.courseWeek.id-1;
    controller = TabController(
      length: widget.course.weeks.length,
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Course Details - Weeks",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: controller,
            children: widget.course.weeks
                .map((week) =>
                    WeekTab(week: week, course: widget.course))
                .toList(),
        ),
      ),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton.small(
            heroTag: 'navigateBefore',
            onPressed: () {
              (_index != 0) ? _index-- : _index = (widget.course.weeks.length - 1);
              controller.animateTo(_index);
              setState(() {});
            },
            hoverElevation: 0,
            elevation: 0,
            child: const Icon(Icons.navigate_before),
          ),
          FloatingActionButton.small(
            heroTag: 'navigateNext',
            onPressed: () {
              (_index != widget.course.weeks.length - 1) ? _index++ : _index = 0;
              controller.animateTo(_index);
              setState(() {});
            },
            hoverElevation: 0,
            elevation: 0,
            child: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
