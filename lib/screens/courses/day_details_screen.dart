import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quran_meadows/screens/courses/widgets/day_tab.dart';
import '../../models/models_barrel.dart';

class DayDetails extends StatefulWidget {
  const DayDetails(
      {Key? key, required this.day, required this.week, required this.imageUrl})
      : super(key: key);

  final CourseWeekDay day;
  final CourseWeek week;
  final String imageUrl;

  @override
  State<DayDetails> createState() => _DayDetailsState();
}

class _DayDetailsState extends State<DayDetails>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _index = widget.day.id - 1;
    controller = TabController(
      length: widget.week.days.length,
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
        toolbarHeight: 50,
        title: Text(
          'Day Tasks',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: controller,
          children: widget.week.days
              .map(
                (day) => DayTab(
                  day: widget.week.days[_index],
                  imageUrl: widget.imageUrl,
                  week: widget.week,
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton.small(
            heroTag: 'navigateBefore',
            onPressed: () {
              (_index != 0) ? _index-- : _index = (widget.week.days.length - 1);
              controller.animateTo(_index);
              setState(() {});
              print("here day id " + _index.toString()+" day is " + DateFormat.yMMMEd().format(widget.day.date));
            },
            hoverElevation: 0,
            elevation: 0,
            child: const Icon(Icons.navigate_before),
          ),
          FloatingActionButton.small(
            heroTag: 'navigateNext',
            onPressed: () {
              (_index != widget.week.days.length - 1) ? _index++ : _index = 0;
              controller.animateTo(_index);
              setState(() {});
              print("here day id " + _index.toString()+" day is " + DateFormat.yMMMEd().format(widget.day.date));
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
