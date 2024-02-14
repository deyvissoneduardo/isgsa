import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_with_bloc/src/views/login_page.dart';

bool isValidEmail(String email) {
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
  );
  return emailRegex.hasMatch(email);
}

void main() {
  testWidgets('Login Button Enabled Test', (WidgetTester tester) async {
    // Construa nosso widget de teste
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginPage(),
        ),
      ),
    );

    // Verifique se o botão está inicialmente desativado
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled,
        isFalse);

    // Preencha o formulário com um e-mail válido
    await tester.enterText(
        find.byKey(const Key('emailTextField')), 'valid@email.com');
    await tester.pump(); // Atualize o widget para refletir as alterações

    // Preencha o formulário com uma senha válida
    await tester.enterText(
        find.byKey(const Key('passwordTextField')), 'password');
    await tester.pump(); // Atualize o widget novamente

    // Verifique se o botão está habilitado agora que ambos os campos são válidos
    expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled,
        isTrue);
  });
}
