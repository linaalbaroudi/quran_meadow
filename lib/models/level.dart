import 'course_week.dart';

class Level {
  final int id;
  final List<CourseWeek> weeks;
  final double? grade;

  Level({required this.id, required this.weeks, this.grade = 0});

  Level copyWith({
    int? id,
    List<CourseWeek>? weeks,
    double? grade,
  }) {
    return Level(
        id: id ?? this.id,
        weeks: weeks ?? this.weeks,
        grade: grade ?? this.grade);
  }

  static List<Level> samples = [
    Level(id: 1, weeks: CourseWeek.samples),
    Level(id: 2, weeks: CourseWeek.samples),
    Level(id: 3, weeks: CourseWeek.samples),
    Level(id: 4, weeks: CourseWeek.samples),
  ];
}
