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

      //find menu button
      Finder menuIcon = find.byIcon(Icons.menu);
      // Emulate a tap on the menu
      await tester.tap(menuIcon);
      // Trigger a frame.
      await tester.pumpAndSettle();

      final Finder searchText = find.text('Search');
      await tester.tap(searchText);
      await tester.pumpAndSettle();
      //write search key
      await tester.enterText(find.byType(TextField), 'hunter hunter');
      Finder searchIcon = find.byIcon(Icons.search);
      await tester.tap(searchIcon);

      // Trigger a frame.
      await tester.pumpAndSettle();
      Finder hunterHunterCard = find.byKey(const ValueKey('46298'));
      await tester.tap(hunterHunterCard);
      await tester.pump(Duration(seconds: 1));
      await tester.pumpAndSettle();

      final Finder addSeries = find.byIcon(Icons.add_circle);
      await tester.tap(addSeries);
      await tester.pumpAndSettle();

      final Finder addToList = find.byKey(const ValueKey('addToList'));
      await tester.tap(addToList);
      await tester.pumpAndSettle();

      final Finder backButton = find.byTooltip("Back");
      await tester.tap(backButton);
      await tester.pumpAndSettle();

      menuIcon = find.byIcon(Icons.menu);
      await tester.tap(menuIcon);
      await tester.pumpAndSettle();

      final Finder listText = find.text('My List');
      await tester.tap(listText);
      await tester.pumpAndSettle();

      expect(find.textContaining('Hunter'), findsOneWidget);
    });
  });
}
