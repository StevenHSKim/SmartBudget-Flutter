import 'dart:convert';
import 'package:flutter/services.dart';
import '/models/profile.dart';

// json 파일 로드 후 프로필 리스트로 변환
// Future 를 이용
Future<List<Profile>> loadProfiles() async {
  String jsonString = await rootBundle.loadString('assets/profiles.json');
  List<dynamic> jsonData = jsonDecode(jsonString); // json 문자열을 리스트로 변환
  return jsonData.map((item) => Profile.fromJSON(item)).toList(); // 프로필 객체 리스트로 변환
}