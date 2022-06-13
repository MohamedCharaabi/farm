import 'dart:io';

import 'package:farm_mobile/domain/models/animal.dart';
import 'package:farm_mobile/domain/models/cow_model.dart';
import 'package:flutter/widgets.dart';

class ProcessAnimal extends Animal {
  String comment;
  String start;
  String end;
  String? status;
  Color? color;
  ProcessAnimal(
      {this.comment = '',
      required this.start,
      required this.end,
      this.status,
      this.color})
      : super(age: 5, id: 10, name: 'Bella');
}

class AnimalProcess extends Cow {
  Cow animal;
  Process process;

  AnimalProcess({required this.animal, required this.process})
      : super(
            id: animal.id,
            name: animal.name,
            age: animal.age,
            status: animal.status);
}

class Process {
  DateTime date;
  String? comment;
  String? foodType;
  double? milk;
  double? food;

  Process(
      {required this.date, this.comment, this.foodType, this.milk, this.food});
}
