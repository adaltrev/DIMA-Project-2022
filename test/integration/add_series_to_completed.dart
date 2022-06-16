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

      //open drawer
      Finder menuIcon = find.byIcon(Icons.menu);
      await tester.tap(menuIcon);
      await tester.pumpAndSettle();

      //open search screen
      final Finder searchText = find.text('Search');
      await tester.tap(searchText);
      await tester.pumpAndSettle();

      //write search key
      await tester.enterText(find.byType(TextField), 'hunter hunter');
      Finder searchIcon = find.byIcon(Icons.search);
      await tester.tap(searchIcon);
      await tester.pumpAndSettle();

      //tap the element we are interested in
      Finder hunterHunterCard = find.byKey(const ValueKey('46298'));
      await tester.tap(hunterHunterCard);
      await tester.pump(Duration(seconds: 1));
      await tester.pumpAndSettle();

      //tap the button to add the series
      final Finder addSeries = find.byIcon(Icons.add_circle);
      await tester.tap(addSeries);
      await tester.pumpAndSettle();

      //select the dropdown menu
      final Finder dropdown = find.byKey(const ValueKey("statusDropdown"));
      await tester.tap(dropdown);
      await tester.pumpAndSettle();

      //select completed category
      final Finder completed = find.text("Completed").last;
      await tester.tap(completed);
      await tester.pumpAndSettle();

      //add series
      final Finder addToList = find.byKey(const ValueKey('addToList'));
      await tester.tap(addToList);
      await tester.pumpAndSettle();

      //go to previous screen
      Finder backButton = find.byTooltip("Back");
      await tester.tap(backButton);
      await tester.pumpAndSettle();

      //open drawer
      menuIcon = find.byIcon(Icons.menu);
      await tester.tap(menuIcon);
      await tester.pumpAndSettle();

      //open main screen
      final Finder listText = find.text('My List');
      await tester.tap(listText);
      await tester.pumpAndSettle();

      //open the Completed tab
      final Finder completedTab = find.text('Completed');
      await tester.tap(completedTab);
      await tester.pumpAndSettle();

      //open the series
      final Finder hunterHunter = find.textContaining('Hunter');
      await tester.tap(hunterHunter);
      await tester.pumpAndSettle();

      //remove the series
      final Finder editIcon = find.byIcon(Icons.edit_note);
      await tester.tap(editIcon);
      await tester.pumpAndSettle();
      final Finder removeButton = find.textContaining('Remove');
      await tester.tap(removeButton);
      await tester.pumpAndSettle();
      backButton = find.byTooltip("Back");
      await tester.tap(backButton);
      await tester.pumpAndSettle();

      expect(find.textContaining('Hunter'), findsNothing);
    });
  });
}
