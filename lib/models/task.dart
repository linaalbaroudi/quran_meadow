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

  Task copyWith({
    int? id,
    String? description,
    Flag? flag,
    int? times,
    int? userMark,
}){
    return Task(
      id: id ?? this.id,
      description: description ?? this.description,
      flag: flag ?? this.flag,
      times: times ?? this.times,
      userMark: userMark ?? this.userMark
    );
  }

  static List<Task> samples = [
    Task(id: 1, description: "individual reading", flag: Flag.mandatory, times: 1),
    Task(id: 2, description: "Listening to the reader and recitation after it", flag: Flag.mandatory, times: 1),
    Task(id: 3, description: "sloping repetition", flag: Flag.mandatory, times: 5),
    Task(id: 4, description: "Read in Prayer", flag: Flag.optional, times: 1),
  ];
}

enum Flag{
  mandatory,
  optional
}