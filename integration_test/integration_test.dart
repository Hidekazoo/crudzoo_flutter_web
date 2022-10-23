import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:crudzoo_flutter_web/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('display title', (widgetTester) async {
      app.main();

      await widgetTester.pumpAndSettle();

      expect(find.text('test app!'), findsOneWidget);
    });
  });
}