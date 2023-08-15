import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/pages/quiz_page.dart';
import 'package:quiz_app/pages/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      routes: {
        ResultPage.routeName: (context) => const ResultPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/b2.jpg'), fit: BoxFit.cover)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Text(
                  'Quizzy',
                  style: GoogleFonts.abyssinicaSil(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 121, 68, 152),
                      fontSize: 90),
                ),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Lottie.asset('animations/start_quiz.json',
                      repeat: true, reverse: true, height: 400),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoModalPopupRoute(
                              builder: (context) => const QuizPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 151, 77, 194),
                          Color.fromARGB(255, 174, 61, 120)
                        ], begin: Alignment.topLeft),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Start Quiz',
                          style: GoogleFonts.abel(fontSize: 50),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
