import 'package:flutter_test/flutter_test.dart';
import 'package:xylophone/main.dart';

void main() {
  testWidgets('shows all seven playable notes', (tester) async {
    await tester.pumpWidget(const XylophoneApp());

    expect(find.text('XYLOPHONE'), findsOneWidget);
    for (final note in ['DO', 'RE', 'MI', 'FA', 'SOL', 'LA', 'SI']) {
      expect(find.text(note), findsOneWidget);
    }
  });
}
