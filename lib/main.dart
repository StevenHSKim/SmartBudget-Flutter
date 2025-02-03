import 'package:flutter/material.dart';

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
  // 프로필 예제 데이터
  final List<Profile> profiles = [
    Profile(
      name: "홍길동",
      imageURL: "assets/cat1.jpg",
      intro: "안녕하세요, 개발자 홍길동입니다."
    ),
    Profile(
        name: "이몽룡",
        imageURL: "assets/dog1.jpeg",
        intro: "안녕하세요, 홍보팀 이몽룡입니다."
    ),
    Profile(
        name: "성춘향",
        imageURL: "assets/ham1.jpeg",
        intro: "안녕하세요, 디자이너 성춘향입니다."
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile List")),
      // ListView 를 이용하면 다수의 항목들을 다룰 수 있다.
      body: ListView.builder(
        // 다룰 항목들의 개수와 iterator 를 설정
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          // ListTile 위젯을 이용하면 이미 만들어진 리스트 폼을 끌어와 쓸 수 있다.
          // leading : 왼쪽 아이콘 (동그라미 프로필 아이콘)
          // title: 제목
          // subtitle: 부제목
          // onTap: 클릭 이벤트
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(profile.imageURL),
            ),
            title: Text(profile.name),
            subtitle: Text(profile.intro),
            onTap: () {
              // Navigator 는 페이지 이동을 관리하는 위젯이다.
              // push 를 이용해 새로운 화면으로 이동이 가능하다.
              Navigator.push(
                context, // 새로운 화면에 넘길 내용
                MaterialPageRoute(
                    builder: (context) => ProfileDetailScreen(profile: profile),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// 프로필 세부 항목
class ProfileDetailScreen extends StatelessWidget {
  final Profile profile;

  // 위젯을 다른 곳에서 받아와야 하는 상황에 사용 : {Key? key}
  // 위젯에 profile 이라는 데이터를 뿌린다.
  const ProfileDetailScreen({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(profile.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // CircleAvatar 위젯을 사용하면 동그라미 이미지를 이쁘게 만들 수 있다.
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profile.imageURL),
            ),
            SizedBox(height: 16),
            Text(profile.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(profile.intro, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}


// 프로필 클래스 작성
class Profile {
  final String name;
  final String imageURL;
  final String intro;

  Profile({required this.name, required this.imageURL, required this.intro});
}