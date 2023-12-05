import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class Questions {
  String question = "";
  List<String> answers = [];
  int correctAnswerIndex = 0;

  Questions(String question, List<String> answers, int correctAnswerIndex) {
    this.question = question;
    this.answers = answers;
    this.correctAnswerIndex = correctAnswerIndex;
  }

  String getQuestion() {
    return question;
  }

  List<String> getAnswers() {
    return answers;
  }

  int getCorrectAnswerIndex() {
    return correctAnswerIndex;
  }
}

class QuizController extends GetxController {
  List<Questions> questions = [
    Questions(
      "In business, ___________ communication skills are crucial for effective collaboration and decision-making.",
      [
        "good",
        "well",
        "better",
        "best",
      ],
      0,
    ),
    Questions(
      "The new marketing strategy was implemented to ___________ brand awareness and attract a larger audience.",
      [
        "rise",
        "raise",
        "arise",
        "arouse",
      ],
      1,
    ),
    Questions(
      "To succeed in the global market, companies must stay abreast of the latest technological ___________.",
      [
        "advances",
        "advancements",
        "improvements",
        "developments",
      ],
      3,
    ),
  ];

  List<Questions> getQuestions() {
    return questions;
  }

  var currentIndex = 0.obs;
  var score = 0.obs;
}

class Problem extends StatelessWidget {
  final QuizController quizController = Get.put(QuizController());

  late Timer _timer;
  int _timerSeconds = 30;

  @override
  Widget build(BuildContext context) {
    List<Questions> questionsList = quizController.getQuestions();

    _startTimer();

    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              "남은 시간 : $_timerSeconds 초",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(width: 0.0, height: 30),
            Text(
              questionsList[quizController.currentIndex.value].question,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ...?_buildAnswerButtons(),
          ],
        ),
      ),
    );
  }

  List<Widget>? _buildAnswerButtons() {
    int number = quizController.currentIndex.value;
    List<Questions> questionsList = quizController.getQuestions();
    Questions questions = questionsList[number];
    List<String> answers = questions.getAnswers();

    return List.generate(
      4,
      (index) => ElevatedButton(
        onPressed: () {
          _cancelTimer();
          _checkAnswer(index);
        },
        child: Text(quizController.questions[number].answers[index]),
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timerSeconds > 0) {
        quizController.update((controller) {
          controller._timerSeconds--;
        } as List<Object>?);
      } else {
        _timesUp();
      }
    });
  }

  void _cancelTimer() {
    _timer.cancel();
    _timerSeconds = 30;
  }

  void _timesUp() {
    _cancelTimer();
    _nextQuestion();
  }

  void _checkAnswer(int selectedIndex) {
    if (selectedIndex == 0) {
      quizController.score++;
    }

    if (quizController.currentIndex.value <
        quizController.questions.length - 1) {
      quizController.currentIndex++;
      _cancelTimer();
      _startTimer();
    } else {
      _showResult();
    }
  }

  void _showResult() {
    Get.defaultDialog(
      title: "퀴즈 완료",
      middleText: "당신의 점수는 ${quizController.score}점 입니다.",
      confirm: ElevatedButton(
        onPressed: () {
          quizController.currentIndex.value = 0;
          quizController.score.value = 0;
          Get.back();
        },
        child: Text("다시 시작"),
      ),
    );
  }

  void _nextQuestion() {
    // Perform actions for moving to the next question
    if (quizController.currentIndex.value <
        quizController.questions.length - 1) {
      quizController.currentIndex++;
      _startTimer();
    } else {
      _showResult();
    }
  }
}
