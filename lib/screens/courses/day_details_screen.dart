import 'package:flutter/material.dart';
import '../../models/models_barrel.dart';
import 'package:quran_meadows/screens/courses/widgets/day_tab.dart';
// import 'package:intl/intl.dart';

class DayDetails extends StatefulWidget {
  const DayDetails({Key? key, required this.course, required this.week, required this.day}) : super(key: key);

  final Course course;
  final CourseWeek week;
  final CourseWeekDay day;

  @override
  State<DayDetails> createState() => _DayDetailsState();
}

class _DayDetailsState extends State<DayDetails> with SingleTickerProviderStateMixin {

  late final TabController tabController;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: widget.week.days.length,
      initialIndex: _index,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 50,
        title: Text(
          'Day Tasks',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: widget.week.days.map((day) => DayTab(course: widget.course, week: widget.week, day: day)).toList(),
      ),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton.small(
            heroTag: 'navigateBefore_day',
            onPressed: () {
              setState(() {
                (_index != 0) ? _index-- : _index = (widget.week.days.length - 1);
                tabController.animateTo(_index);
              });
              print("index="+_index.toString()+", day="+widget.week.days[_index].id.toString());
            },
            hoverElevation: 0,
            elevation: 0,
            child: const Icon(Icons.navigate_before),
          ),
          FloatingActionButton.small(
            heroTag: 'navigateNext_day',
            onPressed: () {
              setState(() {
                (_index != widget.week.days.length - 1) ? _index++ : _index = 0;
                tabController.animateTo(_index);
              });
              print("index="+_index.toString()+", day="+widget.week.days[_index].id.toString());
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
