
import 'package:flutter/material.dart';

class User {
  int id;
  String name;
  String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  static User sample = User(id: 1, name: 'Lina Albaroudi', imageUrl: 'assets/images/lina-logo.jpg');
}
