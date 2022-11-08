import 'level.dart';

class Course {
  String title;
  //todo: implement batches
  List<Level> level; //todo: make it a module
  String imageUrl;
  String institute;


  // TODO: Add servings and ingredients here

  Course({
    required this.title,
    //required this.batch,
    required this.level,
    required this.imageUrl,
    required this.institute,
  });

  static List<Course> samples = [
    Course(
      title: 'Quran Meadows - First Batch',
      level: Level.samples,
      //batch: 1,
      institute: 'Dar Al Dhikr',
      imageUrl: 'assets/quran-course.jpg'
    ),
    Course(
        title: 'Quran Meadows - Second Batch',
        level: Level.samples,
        //batch: 1,
        institute: 'Dar Al Dhikr',
        imageUrl: 'assets/quran-course.jpg'
    ),
    Course(
        title: 'Quran Meadows - Third Batch',
        level: Level.samples,
        //batch: 1,
        institute: 'Dar Al Dhikr',
        imageUrl: 'assets/quran-course.jpg'
    ),
    Course(
        title: 'Quran Meadows - Forth Batch',
        level: Level.samples,
        //batch: 1,
        institute: 'Dar Al Dhikr',
        imageUrl: 'assets/quran-course.jpg'
    ),
  ];
}

// TODO: Add Ingredient() here