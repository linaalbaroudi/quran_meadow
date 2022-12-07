import 'package:flutter/material.dart';
import '../models/models_barrel.dart';

class GradeManager extends ChangeNotifier {

  final _taskGrade = 0.0;
  final _dayGrade = 0.0;
  final _weekGrade = 0.0;
  final _courseGrade = 0.0;

  double get taskGrade => _taskGrade;
  double get dayGrade => _dayGrade;
  double get weekGrade => _weekGrade;
  double get courseGrade => _courseGrade;

  void updateGrade(Course course, int taskIndex, int value){

    notifyListeners();
  }

  double _calculateDayGrade(CourseWeekDay day, int value, int taskIndex,){
    double total = 0;
    List<Task> tasks = day.tasks;
    double taskWorth = 100 / tasks[taskIndex].times!;
    total = value * taskWorth;
    return total;
  }

  // // 3
  // void deleteItem(int index) {
  //   _groceryItems.removeAt(index);
  //   notifyListeners();
  // }
  //
  // // 4
  // void addItem(GroceryItem item) {
  //   _groceryItems.add(item);
  //   notifyListeners();
  // }
  //
  // // 5
  // void updateItem(GroceryItem item, int index) {
  //   _groceryItems[index] = item;
  //   notifyListeners();
  // }
  //
  // // 6
  // void completeItem(int index, bool change) {
  //   final item = _groceryItems[index];
  //   _groceryItems[index] = item.copyWith(isComplete: change);
  //   notifyListeners();
  // }
}