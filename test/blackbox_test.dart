import 'dart:io';

import 'package:anime_world_tutorial/screens/animes_screen.dart';
import 'package:anime_world_tutorial/screens/categories_screen.dart';
import 'package:anime_world_tutorial/screens/home_screen.dart';
import 'package:anime_world_tutorial/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeScreen Blackbox Tests', () {
    testWidgets('Initial screen is AnimesScreen by default',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      expect(find.byType(AnimesScreen), findsOneWidget);
    });

    testWidgets('Initial screen is set by passed index',
        (WidgetTester tester) async {
      const testIndex = 1;

      await tester
          .pumpWidget(const MaterialApp(home: HomeScreen(index: testIndex)));

      expect(find.byType(SearchScreen), findsOneWidget);
    });

    testWidgets('Bottom navigation updates the screen on tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      expect(find.byType(AnimesScreen), findsOneWidget);

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      expect(find.byType(SearchScreen), findsOneWidget);

      await tester.tap(find.text('Categories'));
      await tester.pumpAndSettle();

      expect(find.byType(CategoriesScreen), findsOneWidget);
    });
  });

  group('Anime Screen Tests', () {
    testWidgets(
        'AnimesScreen displays FeaturedAnimes widgets with correct labels',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AnimesScreen(),
        ),
      );

      expect(find.text('Top Ranked'), findsOneWidget);
      expect(find.text('Top Popular'), findsOneWidget);
      expect(find.text('Top Movie Animes'), findsOneWidget);
      expect(find.text('Top Upcoming Animes'), findsOneWidget);

      const currentSeason = 'spring';
      expect(find.text('Top Animes this $currentSeason'), findsOneWidget);
    });

    testWidgets('AnimesScreen loads correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AnimesScreen(),
        ),
      );

      expect(find.text('Anime World'), findsOneWidget);

      expect(find.byIcon(Icons.search), findsOneWidget);
    });
  });
}
