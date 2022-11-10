import 'package:flutter/material.dart';
import '../models/course.dart';
import '../widgets/week_card.dart';

class WeeksGridView extends StatelessWidget {
  const WeeksGridView({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 150,
            //width: 370,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  course.imageUrl,
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
                  left: 10,
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
                          course.level.id.toString(),
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
            child: GridView(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 4 / 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15),
              children: course.level.weeks.map((week) {
                return WeekCard(week: week);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
