import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:test_project/models/student.dart';
import '/models/profile.dart';

// json 파일 로드 후 프로필 리스트로 변환
// Future 를 이용
Future<List<Student>> loadStudents() async {
  String jsonString = await rootBundle.loadString('assets/profiles.json');
  Map<String, dynamic> jsonData = jsonDecode(jsonString); // json 을 맵 형태로 디코딩
  List<dynamic> studentList = jsonData['students'];
  return studentList.map((item) => Student.fromJSON(item)).toList(); // 학생 객체 리스트로 변환
}