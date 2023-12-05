import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sample/component/appBarDefault.dart';
import 'package:sample/controller/authController.dart';

class Nickname extends StatefulWidget {
  const Nickname({Key? key}) : super(key: key);

  @override
  _NicknameState createState() => _NicknameState();
}

class _NicknameState extends State<Nickname> {
  // ** Controller
  TextEditingController _nicknameController = TextEditingController();
  AuthController authController = Get.put(AuthController());

  // ** State
  bool _isButtonEnabled = false;

  // ** Focus
  late FocusNode _nicknameFocusNode;

  // ** Handler
  _updateButtonState() {
    setState(() {
      _isButtonEnabled = _nicknameController.text.isNotEmpty;
    });
  }

  _handleClickNext() {
    authController.setNickname(_nicknameController.text);
    Get.toNamed('/gender');
  }

  // ** Life Cycle
  @override
  void initState() {
    super.initState();
    _nicknameFocusNode = FocusNode();
    _nicknameController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _nicknameFocusNode.dispose();
    _nicknameController.removeListener(_updateButtonState);
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefault('닉네임'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 0.0, height: 16.0),
              Text(
                "닉네임을 입력해주세요",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 8),
              Text(
                "어플 내에서 사용하실 닉네임이 필요해요",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFA1A1A1),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextField(
                    controller: _nicknameController,
                    onChanged: (text) {
                      _updateButtonState();
                    },
                    focusNode:
                        _nicknameFocusNode, // Assign the FocusNode to the TextField
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: '닉네임',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // 포커스된 상태에서의 테두리를 투명하게 만듭니다.
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .grey), // 포커스되지 않은 상태의 테두리 색상을 흰색으로 설정합니다.
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _nicknameController.text.isNotEmpty,
                    child: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Color(0xFFBBBBBB),
                        size: 16,
                      ),
                      onPressed: () {
                        setState(() {
                          _nicknameController.clear();
                          _isButtonEnabled = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(width: 0.0, height: 4.0),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:
                          _isButtonEnabled ? Color(0xFF52A8F6) : Colors.grey,
                      elevation: 0,
                    ),
                    child: Text(
                      '다음',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _isButtonEnabled
                        ? () {
                            _handleClickNext();
                          }
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
