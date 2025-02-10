import 'profile.dart';

class Tutor {
  final Profile profile;
  final List<String> my_students; // 이름만 갖고 오기. Student 자체로 갖고 오는건 비효율적

  Tutor({required this.profile, required this.my_students});

  factory Tutor.fromJSON(Map<String, dynamic> json) {
    return Tutor(
        profile: Profile.fromJSON(json['profile']),
        my_students: List<String>.from(json['student']['name'])
    );
  }
}