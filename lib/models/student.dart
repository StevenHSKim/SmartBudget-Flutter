import 'profile.dart';

class Student {
  final Profile profile;
  final String grade;
  final String my_tutor;

  Student({required this.profile, required this.grade, required this.my_tutor});

  factory Student.fromJSON(Map<String, dynamic> json) {
    return Student(
      profile: Profile.fromJSON(json['profile']),
      grade: json['grade'],
      my_tutor: json['my_tutor']
    );
  }
}