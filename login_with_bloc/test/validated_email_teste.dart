import 'package:test/test.dart';

bool isValidEmail(String email) {
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
  );

  return emailRegex.hasMatch(email);
}

void main() {
  group('Email Validation Tests', () {
    test('Valid Email Test', () {
      final bool result = isValidEmail('test@example.com');
      expect(result, true);
    });

    test('Invalid Email Test - Missing "@"', () {
      final bool result = isValidEmail('invalid.email.com');
      expect(result, false);
    });

    test('Invalid Email Test - Missing "." in Domain', () {
      final bool result = isValidEmail('invalid.email@domaincom');
      expect(result, false);
    });
  });
}
