class Profile {
  final String name;
  final String imageURL;
  final String intro;
  final List<String> subjects;
  final String times;

  Profile({required this.name, required this.imageURL, required this.intro, required this.subjects, required this.times});

  // JSON 파일을 Profile 객체로 변환
  // factory 를 이용하면 json 파일 데이터를 특정 데이터 속성에 매핑이 가능

  factory Profile.fromJSON(Map<String, dynamic> json) {
    return Profile(
        name: json['name'],
        imageURL: json['imageURL'],
        intro: json['intro'],
        subjects: List<String>.from(json['subjects']), // 과목은 배열 형태임
        times: json['times']
    );
  }
}