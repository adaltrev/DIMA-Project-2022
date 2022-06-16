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
      //see if the main screen is correctly rendered
      expect(find.text('Watching'), findsOneWidget);
      expect(find.text('Completed'), findsOneWidget);

      //find menu button
      final Finder menuIcon = find.byIcon(Icons.menu);

      // Emulate a tap on the menu
      await tester.tap(menuIcon);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the drawer is correctly rendered
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('My List'), findsOneWidget);
      expect(find.text('Browse'), findsOneWidget);

      final Finder searchText = find.text('Search');
      await tester.tap(searchText);

      // Trigger a frame.
      await tester.pumpAndSettle();
      //write search key
      await tester.enterText(find.byType(TextField), 'Breaking');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      // Trigger a frame.
      await tester.pumpAndSettle();
      Finder breakigBadCard = find.byKey(const ValueKey('1396'));
      await tester.tap(breakigBadCard);
      await tester.pump(Duration(seconds: 1));
      await tester.pumpAndSettle();

      //check rendering
      expect(find.text('Breaking Bad'), findsOneWidget);
      expect(find.text('Seasons'), findsOneWidget);
      expect(find.byIcon(Icons.add_circle), findsOneWidget);
      expect(find.byKey(const ValueKey('detailsPoster')), findsOneWidget);
      expect(find.textContaining('Genre:'), findsOneWidget);
      expect(find.textContaining('Status:'), findsOneWidget);
      expect(find.textContaining('First aired:'), findsOneWidget);
      expect(find.textContaining('Last aired:'), findsOneWidget);
    });
  });
}
