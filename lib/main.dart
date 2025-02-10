import 'package:flutter/material.dart';
import 'package:test_project/models/student.dart';
import 'services/profile_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileListScreen(),
    );
  }
}

// 메인 화면 (프로필 목록)
class ProfileListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile List")),
      // 퓨쳐 빌더를 이용하면 비동기로 처리하는 데이터를 다룰 수 있다.
      body: FutureBuilder<List<Student>>(
        future: loadStudents(), // 비동기로 다루는 json 파일
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // 로딩창
          } else if (snapshot.hasError) {
            return Center(child: Text("데이터를 불러오는 데 실패하였습니다.")); // 오류 처리
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("프로필이 없습니다.")); // 데이터 미존재
          }

          List<Student> students = snapshot.data!; // 로드한 학생 데이터
          // 로드 데이터를 리스트 뷰에 뿌려준다
          return ListView.builder(
            // 데이터 개수와 이터레이터 설정
            itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return ListTile(
                  leading: CircleAvatar(
                    // 프로필 아이콘 이미지는 웹상에서 가져오는 것이므로 NetworkImage 위젯을 사용
                    backgroundImage: NetworkImage(student.profile.imageURL),
                  ),
                  title: Text(student.profile.name), // 학생 이름
                  subtitle: Text("${student.profile.times.weeks.join(', ')} | ${student.profile.times}"), // 공부 시간대
                  trailing: Text(student.profile.subjects.join(", ")), // 수강 과목
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentDetailScreen(student: student)
                      )
                    );
                  },
                );
              }
          );
        }
      ),
    );
  }
}

// 학생 세부 항목
class StudentDetailScreen extends StatelessWidget {
  final Student student;

  // 위젯을 다른 곳에서 받아와야 하는 상황에 사용 : {Key? key}
  const StudentDetailScreen({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(student.profile.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // CircleAvatar 위젯을 사용하면 동그라미 이미지를 이쁘게 만들 수 있다.
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(student.profile.imageURL),
            ),
            SizedBox(height: 16),
            Text(student.profile.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(student.grade, style: TextStyle(fontSize: 16)),
            Text(student.profile.times.weeks.join(", "), style: TextStyle(fontSize: 16)),
            Text(student.profile.times.times, style: TextStyle(fontSize: 16)),
            Text(student.profile.subjects.join(", "), style: TextStyle(fontSize: 16)),
            Text(student.my_tutor, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}