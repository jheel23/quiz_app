import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/model/questions_answer_model.dart';

class ResultPage extends StatelessWidget {
  static const String routeName = '/result-page';
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    int score = 0;
    final answersfilled =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    for (int i = 0; i < answersfilled.length; i++) {
      for (int j = 0; j < correctAnswers.length; j++) {
        if (answersfilled[i] == correctAnswers[j]) {
          score++;
        }
      }
    }
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/b2.jpg'), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'You Scored $score out of 5',
                style:
                    GoogleFonts.abrilFatface(fontSize: 20, color: Colors.amber),
              ),
              Container(
                padding: const EdgeInsets.all(9),
                height: 600,
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black45),
                child: ListView.builder(
                    itemCount: answersfilled.length,
                    itemBuilder: (context, index) => Column(
                          children: [
                            Text(
                              'Question ${index + 1}: ${questionsAnswers[index].question}',
                              style: GoogleFonts.abrilFatface(
                                  fontSize: 15, color: Colors.amber),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Your Answer:',
                              style: GoogleFonts.abrilFatface(
                                  fontSize: 10, color: Colors.amber),
                            ),
                            Text(
                              '● ${answersfilled[index]}',
                              style: const TextStyle(color: Colors.amber),
                            ),
                            Text(
                              'Correct Answer:',
                              style: GoogleFonts.abrilFatface(
                                  fontSize: 10, color: Colors.amber),
                            ),
                            Text('● ${correctAnswers[index]}',
                                style:
                                    const TextStyle(color: Colors.greenAccent)),
                            if (answersfilled[index] == correctAnswers[index])
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Correct',
                                        style: GoogleFonts.actor(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            if (answersfilled[index] != correctAnswers[index])
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.red),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Wrong',
                                        style: GoogleFonts.actor(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            const Divider()
                          ],
                        )),
              )
            ],
          )),
        ),
      ),
    );
  }
}
