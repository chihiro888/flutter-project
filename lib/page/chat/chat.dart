import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sample/component/appBarChat.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<String> messages = [
    "안녕하세요!",
    "안녕하세요! 반가워요.",
    "오늘 날씨 어때요?",
    "네, 좋아요. 여기 날씨도 괜찮아요.",
    // 여러 메시지를 추가해주세요.
  ];

  TextEditingController messageController = TextEditingController();
  bool isTextFieldEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarChat(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return buildMessageBubble(messages[index], index % 2 == 0);
                },
              ),
            ),
            _buildInputField(),
          ],
        ),
      ),
    );
  }

  Widget buildMessageBubble(String message, bool isSentByUser) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isSentByUser ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          message,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_alt_outlined),
            onPressed: () {
              // 카메라 버튼 눌렀을 때의 동작 추가
            },
          ),
          Expanded(
            child: TextField(
              controller: messageController,
              onChanged: (text) {
                setState(() {
                  isTextFieldEmpty = text.isEmpty;
                });
              },
              decoration: InputDecoration(
                hintText: "메시지 보내기...",
              ),
            ),
          ),
          if (!isTextFieldEmpty)
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                setState(() {
                  messages.add(messageController.text);
                  messageController.clear();
                });
              },
            ),
          if (isTextFieldEmpty)
            IconButton(
              icon: Icon(Icons.mic),
              onPressed: () {
                // 마이크 버튼 눌렀을 때의 동작 추가
              },
            ),
          if (isTextFieldEmpty)
            IconButton(
              icon: Icon(Icons.image),
              onPressed: () {
                setState(() {
                  messages.add(messageController.text);
                  messageController.clear();
                });
              },
            ),
        ],
      ),
    );
  }
}
