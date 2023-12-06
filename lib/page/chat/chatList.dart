import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List<String> chatMessages = [
    "안녕하세요!",
    "안녕하세요! 반가워요!",
    "오늘 날씨 어때요?",
    "좋아요!",
    "뭐하고 있어요?",
    "공부 중이에요.",
    "그럼 화이팅!",
  ];

  @override
  Widget build(BuildContext context) {
    String gender = 'M';
    Color backgroundColor = gender == 'M' ? Color(0xff787ff6) : Color(0xff8478);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatList'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          print('Item clicked: ${chatMessages[index]}');
                          Get.toNamed('/chat');
                        },
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(bottom: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                        'assets/images/sample/user.jpg',
                                      ),
                                    ),
                                    SizedBox(width: 12, height: 0.0),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              '안진용',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 8, height: 0.0),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 6,
                                                  right: 6,
                                                  top: 1,
                                                  bottom: 1),
                                              decoration: BoxDecoration(
                                                color: backgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                      gender == 'M'
                                                          ? Icons.male
                                                          : Icons.female,
                                                      color: Colors.white,
                                                      size: 12),
                                                  Text(
                                                    "30",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 0.0, height: 4.0),
                                        Text(
                                          "hello world",
                                          style: TextStyle(
                                              color: Colors.grey[700]),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
