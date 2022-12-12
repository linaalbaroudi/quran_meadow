import 'package:flutter/material.dart';
import 'package:quran_meadows/models/course.dart';

class Grades extends StatefulWidget {
  const Grades({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  State<Grades> createState() => _GradesState();
}

class _GradesState extends State<Grades> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Colors.teal,
              Color.fromRGBO(133, 78, 155, 1),
            ],
          )),
          margin: EdgeInsets.all(8),
          child: ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Weeks Tasks Score   ',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 60,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${widget.course.grade}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 60,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "/ 100",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            children: <Widget>[
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Card(
                      child: Text(
                        "/bla bla",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            onExpansionChanged: (bool expanded) {},
            collapsedIconColor: Colors.white,
            iconColor: Colors.white,
            backgroundColor: Colors.teal,
          ),
        ),
      ],
    );
  }
}
