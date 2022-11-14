import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/models_barrel.dart';


class MockQuranMeadowService {

  Future<List<Course>> _getAvailableCourses() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json from file system
    final dataString =
    await _loadAsset('assets/sample_data/sample_courses.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);


    if (json['courses'] != null) {
      final courses = <Course>[];
      // json['recipes'].forEach((v) {
      //   Courses.add(ExploreRecipe.fromJson(v));
      // });
      return Course.samples;
    } else {
      return [];
    }
  }

  // Loads sample json data from file system
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}