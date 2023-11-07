import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/component/appBarDefault.dart';

class Birth extends StatefulWidget {
  const Birth({Key? key}) : super(key: key);

  @override
  _BirthState createState() => _BirthState();
}

class _BirthState extends State<Birth> {
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;
  int selectedDay = DateTime.now().day;

  _handleClickNext() {
    Get.toNamed('/profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefault('생년월일'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 0.0, height: 16.0),
              Text(
                "생년월일을 선택해주세요",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 8),
              Text(
                "나의 생년월일을 선택해주세요",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFA1A1A1),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 0.0, height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton<int>(
                    value: selectedYear,
                    onChanged: (int? newValue) {
                      setState(() {
                        selectedYear = newValue!;
                      });
                    },
                    items: List.generate(
                            100, (index) => DateTime.now().year - index)
                        .map((int year) {
                      return DropdownMenuItem<int>(
                        value: year,
                        child: Text(
                          '$year년',
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(width: 16),
                  DropdownButton<int>(
                    value: selectedMonth,
                    onChanged: (int? newValue) {
                      setState(() {
                        selectedMonth = newValue!;
                      });
                    },
                    items: List.generate(12, (index) => index + 1)
                        .map((int month) {
                      return DropdownMenuItem<int>(
                        value: month,
                        child: Text(
                          '$month월',
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(width: 16),
                  DropdownButton<int>(
                    value: selectedDay,
                    onChanged: (int? newValue) {
                      setState(() {
                        selectedDay = newValue!;
                      });
                    },
                    items: List.generate(
                        DateTime(selectedYear, selectedMonth + 1, 0).day,
                        (index) => index + 1).map((int day) {
                      return DropdownMenuItem<int>(
                        value: day,
                        child: Text(
                          '$day일',
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    }).toList(),
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
                        primary: Color(0xFF52A8F6),
                        elevation: 0,
                      ),
                      child: Text(
                        '회원가입',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        _handleClickNext();
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
