import 'package:anime_world_tutorial/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeScreen Whitebox Tests', () {
    testWidgets('onPopInvoked resets _currentScreenIndex to 0 when needed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomeScreen(index: 2),
        ),
      );

      final homeScreenState =
          tester.state<State<HomeScreen>>(find.byType(HomeScreen));

      homeScreenState.onPopInvoked(false);
      expect(homeScreenState._currentScreenIndex, 0);
    });
  });
}
