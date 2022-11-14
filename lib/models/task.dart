import 'task.dart';

class Task{
  int id;
  String description;
  Flag flag; //mandatory or optional
  int times;
  int? userMark;

  Task({
    required this.id,
    required this.description,
    required this.flag,
    required this.times,
    this.userMark
  });

  static List<Task> samples = [
    Task(id: 1, description: "individual reading", flag: Flag.mandatory, times: 1),
    Task(id: 2, description: "Listening to the reader and recitation after it", flag: Flag.mandatory, times: 1),
    Task(id: 2, description: "sloping repetition", flag: Flag.mandatory, times: 5),
    Task(id: 2, description: "Read in Prayer", flag: Flag.optional, times: 1),
  ];
}

enum Flag{
  mandatory,
  optional
}