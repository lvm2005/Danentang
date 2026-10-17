import 'package:flutter_test/flutter_test.dart';
import 'package:quizzler/data/quizz_data.dart';
import 'package:quizzler/main.dart';

void main() {
  testWidgets('shows questions, results, and restarts the quiz', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('QUIZZLER'), findsOneWidget);
    expect(find.text(quizQuestions.first.question), findsOneWidget);

    for (var i = 0; i < quizQuestions.length; i++) {
      await tester.tap(find.text(quizQuestions[i].options.first));
      await tester.pump();
    }

    expect(find.text('Quiz complete!'), findsOneWidget);
    expect(find.text('Try again'), findsOneWidget);

    await tester.tap(find.text('Try again'));
    await tester.pump();

    expect(find.text(quizQuestions.first.question), findsOneWidget);
  });
}
