import 'package:dima_project/widgets/main_drawer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:dima_project/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Drawer test', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.pumpWidget(const MainDrawer());
      expect(find.text('My TV Tracker'), findsOneWidget);
    });
  });
}
