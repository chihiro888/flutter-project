import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  String gender = 'M'; // Replace with actual gender value
  int age = 25; // Replace with actual age value
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    print('Profile');
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = gender == 'M' ? Color(0xff787ff6) : Color(0xff8478);

    @override
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      super.dispose();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                'assets/images/sample/user.jpg',
              ),
            ),
            SizedBox(width: 16, height: 0.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '안진용',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 6, height: 0.0),
                    Container(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(gender == 'M' ? Icons.male : Icons.female,
                              color: Colors.white, size: 14),
                          Text(
                            "30",
                            style: TextStyle(
                              color: Colors.white, // 폰트 색상을 하얀색으로 설정
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  '토익점수 : 300 점',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          ],
        ),
        SizedBox(width: 0.0, height: 18.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "20",
                  style: TextStyle(
                    fontSize: 24, // 원하는 폰트 크기로 조정
                    fontWeight: FontWeight.bold, // 폰트를 굵게 설정
                  ),
                ),
                Text(
                  "팔로잉",
                  style: TextStyle(
                    color: Colors.grey, // 회색으로 설정
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  "7",
                  style: TextStyle(
                    fontSize: 24, // 원하는 폰트 크기로 조정
                    fontWeight: FontWeight.bold, // 폰트를 굵게 설정
                  ),
                ),
                Text(
                  "팔로워",
                  style: TextStyle(
                    color: Colors.grey, // 회색으로 설정
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  "0",
                  style: TextStyle(
                    fontSize: 24, // 원하는 폰트 크기로 조정
                    fontWeight: FontWeight.bold, // 폰트를 굵게 설정
                  ),
                ),
                Text(
                  "피드",
                  style: TextStyle(
                    color: Colors.grey, // 회색으로 설정
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  "395",
                  style: TextStyle(
                    fontSize: 24, // 원하는 폰트 크기로 조정
                    fontWeight: FontWeight.bold, // 폰트를 굵게 설정
                  ),
                ),
                Text(
                  "방문자",
                  style: TextStyle(
                    color: Colors.grey, // 회색으로 설정
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(width: 0.0, height: 20.0),
        Column(
          children: <Widget>[
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: '프로필'),
                Tab(text: '피드'),
                Tab(text: '앰블럼'),
              ],
            ),
          ],
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
