import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:dima_project/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Search a series', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder hunterHunter = find.textContaining('Hunter');
      await tester.tap(hunterHunter);
      await tester.pumpAndSettle();

      final Finder editIcon = find.byIcon(Icons.edit_note);
      await tester.tap(editIcon);
      await tester.pumpAndSettle();

      final Finder removeButton = find.textContaining('Remove');
      await tester.tap(removeButton);
      await tester.pumpAndSettle();

      final Finder backButton = find.byTooltip("Back");
      await tester.tap(backButton);
      await tester.pumpAndSettle();

      expect(find.textContaining('Hunter'), findsNothing);
    });
  });
}
