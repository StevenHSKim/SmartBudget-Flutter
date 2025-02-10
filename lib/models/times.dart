class Times {
  final List<String> weeks;
  final String times;

  Times({required this.weeks, required this.times});

  factory Times.fromJSON(Map<String, dynamic> json) {
    return Times(
        weeks: List<String>.from(json['weeks']),
        times: json['times']
    );
  }
}

// profile 의 하위 데이터
