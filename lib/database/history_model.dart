import 'package:flutter/material.dart';

class HistoryModel {
  String id;
  String date;
  String problemString;
  String solution;

  HistoryModel({
    required this.id,
    required this.date,
    required this.problemString,
    required this.solution,
  });

  factory HistoryModel.fromMap(Map<String, dynamic> json) => HistoryModel(
        id: json['ID'],
        date: json['Date'],
        problemString: json['Problem_String'],
        solution: json['isCompleted'],
      );

  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'Date': date,
      'Problem_String': problemString,
      'Solution': solution,
    };
  }
}
