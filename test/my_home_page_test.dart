import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_app/my_home_page.dart';

void main() {
  const titleText = 'Please sign in to our service';
  const errorText = 'Please provide a correct username';

  testWidgets('Idle state smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: MyHomePage(),
    ));

    // Check if title is visible
    expect(find.text(titleText), findsOneWidget);

    // Check if error is hidden
    expect(find.text(errorText), findsNothing);
  });

  testWidgets('Incorrect username should trigger error',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: MyHomePage(),
    ));

    // Check if error is hidden
    expect(find.text(errorText), findsNothing);

    // Focus the textfield
    await tester.tap(find.byType(TextField));

    // Type text
    tester.testTextInput.enterText('bad%user');

    // Tap the button
    await tester.tap(find.byIcon(Icons.done));

    // Trigger a frame
    await tester.pump();

    // Check if error is visible
    expect(find.text(errorText), findsOneWidget);
  });
}
