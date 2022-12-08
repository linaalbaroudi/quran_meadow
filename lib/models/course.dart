import 'course_week.dart';

class Course {
  final String title;
  final int level;
  final String imageUrl;
  final String institute;
  final bool activated;
  final List<CourseWeek> weeks;
  final double? grade;

  Course(
      {required this.title,
      required this.level,
      required this.imageUrl,
      required this.institute,
      this.activated = false,
      required this.weeks,
      this.grade = 0});

  Course copyWith({
    String? title,
    int? level,
    String? imageUrl,
    String? institute,
    bool? activated,
    List<CourseWeek>? weeks,
    double? grade,
  }) {
    return Course(
      title: title ?? this.title,
      level: level ?? this.level,
      imageUrl: imageUrl ?? this.imageUrl,
      institute: institute ?? this.institute,
      activated: activated ?? this.activated,
        weeks: weeks ?? this.weeks,
        grade: grade ?? this.grade
    );
  }

  static List<Course> samples = [
    Course(
        title: 'Quran Meadows - Baqarah (1-177)',
        level: 1,
        institute: 'Dar Al Dhikr',
        imageUrl: 'assets/images/quran-course.jpg',
        weeks: CourseWeek.samples
    ),
    Course(
        title: 'Quran Meadows - Baqarah (178-286)',
        level: 2,
        institute: 'Dar Al Dhikr',
        imageUrl: 'assets/images/quran-course.jpg',
        weeks: CourseWeek.samples
    ),
    Course(
        title: 'Quran Meadows - Al-Imran (1-200)',
        level: 3,
        //batch: 1,
        institute: 'Dar Al Dhikr',
        imageUrl: 'assets/images/quran-course.jpg',
        weeks: CourseWeek.samples
    ),
    Course(
        title: 'Quran Meadows - An-Nisa (1-176)',
        level: 4,
        //batch: 1,
        institute: 'Dar Al Dhikr',
        imageUrl: 'assets/images/quran-course.jpg',
        weeks: CourseWeek.samples
    ),
  ];
}
