import 'task.dart';

class CourseWeekDay{
  int id;
  DateTime date;
  String quorum;
  List<Task> tasks;
  double? dayGrade;
  static const int totalDayGrade = 100;

  CourseWeekDay({
    required this.id,
    required this.date,
    required this.quorum,
    required this.tasks,
    this.dayGrade,
  });

  static List<CourseWeekDay> samples = [
    CourseWeekDay(id: 1, date: DateTime.now(), quorum: "Baqara (1-18)", tasks: Task.samples),
    CourseWeekDay(id: 2, date: DateTime.now().subtract(const Duration(days: 1)), quorum: "Baqara (1-17)", tasks: Task.samples),
    CourseWeekDay(id: 3, date: DateTime.now().subtract(const Duration(days: 2)), quorum: "Baqara (18-25)", tasks: Task.samples),
    CourseWeekDay(id: 4, date: DateTime.now().subtract(const Duration(days: 3)), quorum: "Baqara (26-33)", tasks: Task.samples),
    CourseWeekDay(id: 5, date: DateTime.now().subtract(const Duration(days: 4)), quorum: "Baqara (34-48)", tasks: Task.samples),
    CourseWeekDay(id: 6, date: DateTime.now().subtract(const Duration(days: 5)), quorum: "Baqara (49-60)", tasks: Task.samples),
    CourseWeekDay(id: 7, date: DateTime.now().subtract(const Duration(days: 6)), quorum: "Baqara (61-74)", tasks: Task.samples),
  ];
}