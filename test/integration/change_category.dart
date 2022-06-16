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

      Finder series = find.textContaining("Hunter");
      await tester.tap(series);
      await tester.pumpAndSettle();

      Finder editIcon = find.byIcon(Icons.edit_note);
      await tester.tap(editIcon);
      await tester.pumpAndSettle();

      Finder dropdown = find.byKey(const ValueKey("statusDropdown"));
      await tester.tap(dropdown);
      await tester.pumpAndSettle();

      final Finder wishlist = find.textContaining("Plan").last;
      await tester.tap(wishlist);
      await tester.pumpAndSettle();

      Finder editButton = find.text("Edit");
      await tester.tap(editButton);
      await tester.pumpAndSettle();

      Finder backButton = find.byTooltip("Back");
      await tester.tap(backButton);
      await tester.pumpAndSettle();

      Finder wishlistTab = find.textContaining("Wishlist");
      await tester.tap(wishlistTab);
      await tester.pumpAndSettle();

      series = find.textContaining("Hunter");
      await tester.tap(series);
      await tester.pumpAndSettle();

      editIcon = find.byIcon(Icons.edit_note);
      await tester.tap(editIcon);
      await tester.pumpAndSettle();

      dropdown = find.byKey(const ValueKey("statusDropdown"));
      await tester.tap(dropdown);
      await tester.pumpAndSettle();

      final Finder watching = find.text("Watching").last;
      await tester.tap(watching);
      await tester.pumpAndSettle();

      editButton = find.text("Edit");
      await tester.tap(editButton);
      await tester.pumpAndSettle();

      backButton = find.byTooltip("Back");
      await tester.tap(backButton);
      await tester.pumpAndSettle();

      Finder watchingTab = find.text("Watching");
      await tester.tap(watchingTab);
      await tester.pumpAndSettle();
    });
  });
}
