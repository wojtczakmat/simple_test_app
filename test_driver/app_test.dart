import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Simple App', () {
    final textFieldFinder = find.byValueKey('textField');
    final signedInTextFinder = find.byValueKey('signedInText');
    final submitButtonFinder = find.byValueKey('submit');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('navigates further on correct input', () async {
      await driver.tap(textFieldFinder);
      await driver.enterText('test');
      await driver.tap(submitButtonFinder);

      expect(
        await driver.getText(signedInTextFinder),
        'You are signed in :)',
      );
    });
  });
}
