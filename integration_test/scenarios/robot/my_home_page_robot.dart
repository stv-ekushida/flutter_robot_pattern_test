import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyHomePageRobot {
  MyHomePageRobot(this.tester);

  final WidgetTester tester;
  final _findable = _MyHomePageFindable();

  Future<void> increment() async {
    await tester.tap(_findable.incrementButton);
    await tester.pumpAndSettle();
  }

  void verify(String value) {
    expect(_findable.counterText(value), findsOneWidget);
  }
}

class _MyHomePageFindable {
  Finder counterText(String text) => find.text(text);

  final incrementButton = find.byKey(const ValueKey('increment'));
}
