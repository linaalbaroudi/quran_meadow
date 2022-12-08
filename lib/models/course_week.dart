import 'course_week_day.dart';

class CourseWeek{
  final int id;
  final List<CourseWeekDay> days;
  late final int weeklyExamGrade;
  late final double weekGrade;
  static const int totalWeekGrade = 100;

  CourseWeek({
    required this.id,
    required this.days,
    this.weeklyExamGrade = 0,
    this.weekGrade = 0,
  });

  CourseWeek copyWith({
    int? id,
    List<CourseWeekDay>? days,
    int? weeklyExamGrade,
    double? weekGrade,
  }) {
    return CourseWeek(
      id: id ?? this.id,
      days: days ?? this.days,
      weekGrade: weekGrade ?? this.weekGrade,
      weeklyExamGrade: weeklyExamGrade ?? this.weeklyExamGrade,
    );
  }

  static List<CourseWeek> samples = [
    CourseWeek(id: 1, days: CourseWeekDay.samples),
    CourseWeek(id: 2, days: CourseWeekDay.samples),
    CourseWeek(id: 3, days: CourseWeekDay.samples),
    CourseWeek(id: 4, days: CourseWeekDay.samples),
    CourseWeek(id: 5, days: CourseWeekDay.samples),
    CourseWeek(id: 6, days: CourseWeekDay.samples),
    CourseWeek(id: 7, days: CourseWeekDay.samples),
    CourseWeek(id: 8, days: CourseWeekDay.samples),
    CourseWeek(id: 9, days: CourseWeekDay.samples),
    CourseWeek(id: 10, days: CourseWeekDay.samples),
    CourseWeek(id: 11, days: CourseWeekDay.samples),
    CourseWeek(id: 12, days: CourseWeekDay.samples),
  ];
}