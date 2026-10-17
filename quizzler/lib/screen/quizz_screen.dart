import 'package:flutter/material.dart';

import '../data/quizz_data.dart';
import '../models/question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  void _answerQuestion(int selectedIndex) {
    if (selectedIndex ==
        quizQuestions[_currentQuestionIndex].correctAnswerIndex) {
      _score++;
    }
    setState(() => _currentQuestionIndex++);
  }

  void _restartQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isComplete = _currentQuestionIndex >= quizQuestions.length;
    return Scaffold(
      body: SafeArea(child: isComplete ? _buildResults() : _buildQuestion()),
    );
  }

  Widget _buildQuestion() {
    final Question question = quizQuestions[_currentQuestionIndex];
    final progress = (_currentQuestionIndex + 1) / quizQuestions.length;

    return LayoutBuilder(
      builder:
          (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 22, 24, 28),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - 50,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildHeader(),
                      const SizedBox(height: 34),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'QUESTION ${_currentQuestionIndex + 1}',
                            style: const TextStyle(
                              color: Color(0xFFADB8D0),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF202B43),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.bolt_rounded,
                                  color: Color(0xFFFFD166),
                                  size: 16,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '$_score points',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 7,
                          backgroundColor: const Color(0xFF26314A),
                          valueColor: const AlwaysStoppedAnimation(
                            Color(0xFF8B7CFF),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      Container(
                        padding: const EdgeInsets.fromLTRB(24, 26, 24, 28),
                        decoration: BoxDecoration(
                          color: const Color(0xFF182238),
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(color: const Color(0xFF293550)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 43,
                              height: 43,
                              decoration: BoxDecoration(
                                color: const Color(0xFF302B5B),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Icon(
                                Icons.lightbulb_outline_rounded,
                                color: Color(0xFFB7AEFF),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              question.question,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                height: 1.3,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Choose the best answer',
                              style: TextStyle(
                                color: Color(0xFF9DA9C2),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),
                      ...List.generate(
                        question.options.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 11),
                          child: _AnswerButton(
                            index: index,
                            answer: question.options[index],
                            onPressed: () => _answerQuestion(index),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Center(
                        child: Text(
                          'A little knowledge goes a long way.',
                          style: TextStyle(
                            color: Color(0xFF77839B),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 47,
          height: 47,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF9183FF), Color(0xFF695AE8)],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(Icons.quiz_rounded, color: Colors.white, size: 25),
        ),
        const SizedBox(width: 13),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'QUIZZLER',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 16,
                letterSpacing: 1.7,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Test your knowledge',
              style: TextStyle(color: Color(0xFF9DA9C2), fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildResults() {
    final percentage = (_score / quizQuestions.length * 100).round();

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: const Color(0xFF182238),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: const Color(0xFF293550)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 78,
                  height: 78,
                  decoration: BoxDecoration(
                    color: const Color(0xFF302B5B),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.emoji_events_rounded,
                    color: Color(0xFFFFD166),
                    size: 42,
                  ),
                ),
                const SizedBox(height: 23),
                const Text(
                  'Quiz complete!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 9),
                const Text(
                  'Here is how you did',
                  style: TextStyle(color: Color(0xFF9DA9C2), fontSize: 15),
                ),
                const SizedBox(height: 28),
                Text(
                  '$_score',
                  style: const TextStyle(
                    color: Color(0xFFB7AEFF),
                    fontSize: 58,
                    height: 1,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'OUT OF ${quizQuestions.length}  •  $percentage%',
                  style: const TextStyle(
                    color: Color(0xFFADB8D0),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.3,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton.icon(
                    onPressed: _restartQuiz,
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text(
                      'Try again',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF7869F4),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
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

class _AnswerButton extends StatelessWidget {
  const _AnswerButton({
    required this.index,
    required this.answer,
    required this.onPressed,
  });

  final int index;
  final String answer;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 59,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF151E32),
          side: const BorderSide(color: Color(0xFF2A3650)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 31,
              height: 31,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF252F49),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                String.fromCharCode(65 + index),
                style: const TextStyle(
                  color: Color(0xFFB7AEFF),
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Text(
                answer,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_rounded,
              color: Color(0xFF8491AA),
              size: 19,
            ),
          ],
        ),
      ),
    );
  }
}
