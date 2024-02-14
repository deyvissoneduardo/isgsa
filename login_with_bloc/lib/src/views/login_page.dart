import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_with_bloc/src/bloc/login_bloc.dart';
import 'package:login_with_bloc/src/bloc/login_event.dart';
import 'package:login_with_bloc/src/bloc/login_state.dart';
import 'package:login_with_bloc/src/core/helpers/validate.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  bool isFormValid() {
    return ValidationUtils.isValidEmail(usernameController.text) &&
        passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Login com Sucesso'),
                ),
              );
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    key: const Key('emailTextField'),
                    controller: usernameController,
                    decoration:
                        const InputDecoration(labelText: 'Nome de usuário'),
                    onChanged: (_) {
                      context.read<LoginBloc>().add(LoginButtonPressed(
                            username: usernameController.text,
                            password: passwordController.text,
                          ));
                    },
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    key: const Key('passwordTextField'),
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Senha'),
                    onChanged: (_) {
                      context.read<LoginBloc>().add(LoginButtonPressed(
                            username: usernameController.text,
                            password: passwordController.text,
                          ));
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isFormValid()
                        ? () {
                            context.read<LoginBloc>().add(LoginButtonPressed(
                                  username: usernameController.text,
                                  password: passwordController.text,
                                ));
                          }
                        : null,
                    child: const Text('Login'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
