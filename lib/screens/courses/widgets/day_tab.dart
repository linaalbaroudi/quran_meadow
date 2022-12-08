import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../../models/models_barrel.dart';

class DayTab extends StatefulWidget {
  const DayTab(
      {Key? key, required this.course, required this.week, required this.day})
      : super(key: key);

  final Course course;
  final CourseWeek week;
  final CourseWeekDay day;

  @override
  State<DayTab> createState() => _DayTabState();
}

class _DayTabState extends State<DayTab> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  Positioned(
                    bottom: 50,
                    left: 10,
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
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Chip(
                      backgroundColor: Colors.teal,
                      label: Text(
                        DateFormat('EEEE').format(widget.day.date),
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
            flex: 2,
            child: Container(
              width: double.infinity,
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Day:  ",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        DateFormat.yMMMEd().format(widget.day.date),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Quorum:  ",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        widget.day.quorum,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                  const Divider(),
                  Container(
                    child: buildScoreField(widget.day),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: ListView.builder(
                  itemCount: widget.day.tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildTaskField(widget.day.tasks[index], index);
                  }),
            ),
          )
        ],
      );
  }

  Widget buildScoreField(CourseWeekDay day) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Total Score:  ",
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(
          width: 90,
          height: 48,
          child: TextField(
            controller: null,
            enabled: false,
            decoration: InputDecoration(
              hintText: "${day.dayGrade}",
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
    );
  }

  Widget buildTaskField(Task task, int key) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: "${task.description}  ",
                    style: Theme.of(context).textTheme.headline3,
                    children: <TextSpan>[
                      TextSpan(text: "(${task.flag.name})",
                        style: TextStyle(
                          color: task.flag.name == Flag.optional.name
                              ? const Color.fromRGBO(0, 118, 223, 1)
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  cursorColor: Colors.teal,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                    hintText: "/${task.times}",
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                  ),
                  onChanged: (value){
                    _onUpdate(key, value);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            height: 48,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: task.flag.name == Flag.optional.name
                  ? const Color.fromRGBO(0, 118, 223, 1)
                  : Colors.grey,
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Center(
              child: Text(
                "/ ${task.times}",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onUpdate(int key, String value) {
    //ToDo:
    // Map<String, dynamic> json = {'id': key, 'value': value};
    // Task oldTask = _day.tasks[key];
    // Task newTask = oldTask;
    // newTask.userMark = value as int?;
  }

}
