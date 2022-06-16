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
      //go to search screen
      final Finder searchText = find.text('Search');
      await tester.tap(searchText);
      await tester.pumpAndSettle();
      //write search key
      await tester.enterText(find.byType(TextField), 'hunter hunter');
      Finder searchIcon = find.byIcon(Icons.search);
      await tester.tap(searchIcon);
      await tester.pumpAndSettle();
      //select the card for the series Hunter x Hunter
      Finder hunterHunterCard = find.byKey(const ValueKey('46298'));
      await tester.tap(hunterHunterCard);
      await tester.pump(Duration(seconds: 1));
      await tester.pumpAndSettle();
      //tap the button to add the series
      final Finder addSeries = find.byIcon(Icons.add_circle);
      await tester.tap(addSeries);
      await tester.pumpAndSettle();
      //click the button in the bottom modal sheet
      final Finder addToList = find.byKey(const ValueKey('addToList'));
      await tester.tap(addToList);
      await tester.pumpAndSettle();
      //go back a screen
      Finder backButton = find.byTooltip("Back");
      await tester.tap(backButton);
      await tester.pumpAndSettle();
      //open drawer
      menuIcon = find.byIcon(Icons.menu);
      await tester.tap(menuIcon);
      await tester.pumpAndSettle();
      //open list screen
      final Finder listText = find.text('My List');
      await tester.tap(listText);
      await tester.pumpAndSettle();
      //verify that the series has 0 episodes watched
      expect(find.textContaining("0"), findsOneWidget);
      //add 4 episodes
      final Finder addEpisode = find.byIcon(Icons.add);
      await tester.tap(addEpisode);
      await tester.tap(addEpisode);
      await tester.tap(addEpisode);
      await tester.tap(addEpisode);
      await tester.pumpAndSettle();
      //check if ui has been updated
      expect(find.textContaining("4"), findsOneWidget);

      //delete the series
      final Finder hunterHunter = find.textContaining('Hunter');
      await tester.tap(hunterHunter);
      await tester.pumpAndSettle();
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
