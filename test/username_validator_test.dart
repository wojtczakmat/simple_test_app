import 'package:flutter_test/flutter_test.dart';
import 'package:simple_app/username_validator.dart';

void main() {
  test('Username should be minimum 3 characters long', () {
    expect(validateUsername('ab'), false);
  });
  test('Username should be maximum 15 characters long', () {
    expect(validateUsername('1234567890123456'), false);
  });
  test('Username can\'t be null', () {
    expect(validateUsername(null), false);
  });
  test('Username can\'t contain percent sign', () {
    expect(validateUsername('foo%'), false);
  });
  test('Username can contain other unicode signs than percent', () {
    expect(validateUsername('use(r)name'), true);
  });
}
