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
      title: 'Quran Meadows - Baqarah (1-177)',
      level: Level.samples[0],
      //batch: 1,
      institute: 'Dar Al Dhikr',
      imageUrl: 'assets/images/quran-course.jpg'
    ),
    Course(
        title: 'Quran Meadows - Baqarah (178-286)',
        level: Level.samples[1],
        //batch: 1,
        institute: 'Dar Al Dhikr',
        imageUrl: 'assets/images/quran-course.jpg'
    ),
    Course(
        title: 'Quran Meadows - Al-Imran (1-200)',
        level: Level.samples[2],
        //batch: 1,
        institute: 'Dar Al Dhikr',
        imageUrl: 'assets/images/quran-course.jpg'
    ),
    Course(
        title: 'Quran Meadows - An-Nisa (1-176)',
        level: Level.samples[3],
        //batch: 1,
        institute: 'Dar Al Dhikr',
        imageUrl: 'assets/images/quran-course.jpg'
    ),
  ];
}

// TODO: Add Ingredient() here