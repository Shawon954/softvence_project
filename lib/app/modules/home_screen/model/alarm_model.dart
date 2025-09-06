import 'package:flutter/material.dart';

class AlarmModel {
  final String id;
  final TimeOfDay time;
  final String date;
  final bool isActive;

  AlarmModel({
    required this.id,
    required this.time,
    required this.date,
    required this.isActive,
  });

  AlarmModel copyWith({
    String? id,
    TimeOfDay? time,
    String? date,
    bool? isActive,
  }) {
    return AlarmModel(
      id: id ?? this.id,
      time: time ?? this.time,
      date: date ?? this.date,
      isActive: isActive ?? this.isActive,
    );
  }
}
