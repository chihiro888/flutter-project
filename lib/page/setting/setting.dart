import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // ** Handler
  _handleClickSignOut() {
    Get.offAllNamed('/signIn');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      SizedBox(width: 0.0, height: 12.0),
                      CustomListTile(
                        title: '알림 수신',
                        onTap: () {
                          //
                        },
                      ),
                      CustomListTile(
                        title: '개인정보보호',
                        onTap: () {
                          //
                        },
                      ),
                      SizedBox(width: 0.0, height: 12.0),
                      CustomListTile(
                        title: '정보',
                        onTap: () {
                          //
                        },
                      ),
                      CustomListTile(
                        title: 'GPTOEIC 평가하기',
                        onTap: () {
                          //
                        },
                      ),
                      SizedBox(width: 0.0, height: 12.0),
                      Container(
                        decoration: new BoxDecoration(color: Colors.white),
                        child: ListTile(
                          title: Center(
                            child: Text('로그아웃'),
                          ),
                          onTap: () {
                            _handleClickSignOut();
                          },
                          tileColor:
                              Colors.white, // Background color of ListTile
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListTile(
        title: Text(title),
        onTap: onTap,
        tileColor: Colors.white,
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 14,
          color: Colors.grey,
        ),
      ),
    );
  }
}
