import 'package:flutter_test/flutter_test.dart';
import 'package:micard/main.dart';

void main() {
  testWidgets('shows the requested MiCard profile', (tester) async {
    await tester.pumpWidget(const MiCardApp());

    expect(find.text('Lê Mẫn'), findsOneWidget);
    expect(find.text('0123456789'), findsOneWidget);
    expect(find.text('manlv.23it@vku.udn.vn'), findsOneWidget);
  });
}
