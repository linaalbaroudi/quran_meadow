import 'level.dart';

class Course {
  String title;
  //todo: implement batches
  Level level; //todo: make it a module
  String imageUrl;
  String institute;
  bool favorite;


  // TODO: Add servings and ingredients here

  Course({
    required this.title,
    //required this.batch,
    required this.level,
    required this.imageUrl,
    required this.institute,
    this.favorite = false
  });

  static List<Course> samples = [
    Course(
      title: 'Quran Meadows - First Batch',
      level: Level.samples[3],
      //batch: 1,
      institute: 'Dar Al Dhikr',
      imageUrl: 'assets/quran-course.jpg'
    ),
    Course(
        title: 'Quran Meadows - Second Batch',
        level: Level.samples[2],
        //batch: 1,
        institute: 'Dar Al Dhikr',
        imageUrl: 'assets/quran-course.jpg'
    ),
    Course(
        title: 'Quran Meadows - Third Batch',
        level: Level.samples[1],
        //batch: 1,
        institute: 'Dar Al Dhikr',
        imageUrl: 'assets/quran-course.jpg'
    ),
    Course(
        title: 'Quran Meadows - Forth Batch',
        level: Level.samples[0],
        //batch: 1,
        institute: 'Dar Al Dhikr',
        imageUrl: 'assets/quran-course.jpg'
    ),
  ];
}

// TODO: Add Ingredient() here