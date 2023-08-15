import 'package:quiz_app/model/quiz_questions.dart';

final questionsAnswers = [
  QuizQuestions(
      'What is the capital of France?', ['Rome', 'Berlin', 'Paris', 'Madrid']),
  QuizQuestions(
    'Which planet is known as the "Red Planet"?',
    ['Venus', 'Mars', 'Mercury', 'Jupiter'],
  ),
  QuizQuestions(
    'Who painted the Mona Lisa?',
    [
      'Vincent van Gogh',
      'Pablo Picasso',
      'Michelangelo',
      'Leonardo da Vinci',
    ],
  ),
  QuizQuestions(
    'What is the chemical symbol for gold?',
    ['Au', 'Ag', 'G', 'Go'],
  ),
  QuizQuestions(
    'Which scientist developed the theory of relativity?',
    ['Isaac Newton', 'Galileo Galilei', 'Albert Einstein', 'Marie Curie'],
  ),
];
final correctAnswers = [
  'Paris',
  'Mars',
  'Leonardo da Vinci',
  'Au',
  'Albert Einstein'
];
