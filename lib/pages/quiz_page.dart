import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/model/questions_answer_model.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var questionIndex = 0;
  List<String> answersFilled = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        // onVerticalDragStart: (_) {},
        onVerticalDragUpdate: (details) {
          if (details.delta.dy > 9) {
            Navigator.pop(context);
          }
        },
        dragStartBehavior: DragStartBehavior.down,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/b2.jpg'),
                  fit: BoxFit.cover)),
          child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: const Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 0.0, 0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                backgroundColor: Colors.transparent,
              ),
              backgroundColor: Colors.transparent,
              body: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: SizedBox(
                          child: Text(
                            '${questionIndex + 1}. ${questionsAnswers[questionIndex].question}',
                            style: GoogleFonts.abel(
                                fontSize: 30, color: Colors.amber),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          answersContainer('A', 0),
                          answersContainer('B', 1),
                          answersContainer('C', 2),
                          answersContainer('D', 3),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget answersContainer(String option, int answerIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (questionIndex == 4) {
            answersFilled
                .add(questionsAnswers[questionIndex].answers[answerIndex]);
            Navigator.popAndPushNamed(context, '/result-page',
                arguments: answersFilled);
            return;
          }
          answersFilled
              .add(questionsAnswers[questionIndex].answers[answerIndex]);
          questionIndex++;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(9),
        alignment: Alignment.center,
        height: 90,
        width: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black45),
        child: FittedBox(
          child: Text(
            '$option. ${questionsAnswers[questionIndex].answers[answerIndex]}',
            style: GoogleFonts.abel(fontSize: 30, color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
