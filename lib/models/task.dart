import 'task.dart';

class Task{
  int id;
  String description;
  Flag flag; //mandatory or optional
  int taskMark;
  int? userMark;

  Task({
    required this.id,
    required this.description,
    required this.flag,
    required this.taskMark,
    this.userMark
  });

  static List<Task> samples = [
    Task(id: 1, description: "individual reading", flag: Flag.mandatory, taskMark: 1),
    Task(id: 2, description: "Listening to the reader and recitation after it", flag: Flag.mandatory, taskMark: 1),
    Task(id: 2, description: "sloping repetition", flag: Flag.mandatory, taskMark: 5),
    Task(id: 2, description: "Read in Prayer", flag: Flag.optional, taskMark: 1),
  ];
}

enum Flag{
  mandatory,
  optional
}