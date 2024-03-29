import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../../models/models_barrel.dart';
import '../day_details_screen.dart';
import './day_card.dart';

class WeekTab extends StatefulWidget {
  const WeekTab({Key? key, required this.week, required this.course})
      : super(key: key);

  final CourseWeek week;
  final Course course;

  @override
  State<WeekTab> createState() => _WeekTabState();
}

class _WeekTabState extends State<WeekTab> {
  final _weeklyExamGradeController = TextEditingController();
  int _weeklyExamGrade = 0;
  double _weekGrade = 0.0;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    final originalWeeklyExamGrade = widget.week.weeklyExamGrade;
    final originalWeekGrade = widget.week.weekGrade;
    _weeklyExamGradeController.text = originalWeeklyExamGrade.toString();
    _weeklyExamGrade = originalWeeklyExamGrade;
    _weekGrade = originalWeekGrade;

    _weeklyExamGradeController.addListener(() {
      setState(() {
        _weeklyExamGrade = _weeklyExamGradeController.text as int;
      });
    });
  }

  @override
  void dispose() {
    _weeklyExamGradeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 10,
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
                    label: Text(
                      "Week ${widget.week.id}",
                      style: const TextStyle(
                        //fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "  From Date:",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            Text(
                              "  ${DateFormat.yMMMEd().format(widget.week.days[0].date)}",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                        const VerticalDivider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "To Date:",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            Text(
                              DateFormat.yMMMEd()
                                  .format(widget.week.days[0].date),
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  buildScoreField(widget.week),
                  const Divider(),
                  Row(
                    children: [
                      SizedBox(
                        width: 170,
                        child: TextField(
                          controller: _weeklyExamGradeController,
                          cursorColor: Colors.teal,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: const InputDecoration(
                            hintText: '/100',
                            label: Text("Weekly Assessment: "),
                            labelStyle: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 8),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                          ),
                          onSubmitted: (value) {
                            setState(() {
                              _weekGrade -= _weeklyExamGrade;
                              _weeklyExamGrade = value as int;
                              _weekGrade += _weeklyExamGrade;
                            });
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.teal,
                            fixedSize: const Size(50,50)
                        ),
                        child: const Icon(Icons.save_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: ListView.builder(
              padding:
              const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
              itemCount: widget.week.days.length,
              //shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          print(widget.week.days[index].id);
                          return DayDetails(
                            course: widget.course,
                            day: widget.week.days[index],
                            week: widget.week,
                          );
                        }),
                    );
                  },
                  splashColor: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  child: DayCard(day: widget.week.days[index]),
                );
              }),
        ),
      ],
    );
  }

  Widget buildScoreField(CourseWeek week) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Week Score:  ",
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(
          width: 90,
          height: 48,
          child: TextField(
            controller: null,
            enabled: false,
            decoration: InputDecoration(
              hintText: "${week.weekGrade}",
              contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          height: 48,
          width: 90,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: const Center(
            child: Text(
              "/ 100",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}