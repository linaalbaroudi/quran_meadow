import 'course_week.dart';

class Level{
  int id;
  List<CourseWeek> weeks;
  double? grade;

  Level(
      {
        required this.id,
        required this.weeks,
        this.grade
      }
      );

  static List<Level> samples = [
    Level(id: 1, weeks: CourseWeek.samples),
    Level(id: 2, weeks: CourseWeek.samples),
    Level(id: 3, weeks: CourseWeek.samples),
    Level(id: 4, weeks: CourseWeek.samples),
  ];
}