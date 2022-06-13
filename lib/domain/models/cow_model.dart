import 'package:flutter/material.dart';

class Cow {
  const Cow(
      {required this.id,
      required this.name,
      this.age,
      this.status = CowStatus.notMilky});

  final String id;
  final String name;
  final String? age;
  final CowStatus status;

  @override
  String toString() {
    return '$name, $id';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Cow && other.name == name && other.id == id;
  }

  @override
  int get hashCode => hashValues(id, name);
}

enum CowStatus {
  milky,
  notMilky,
}
