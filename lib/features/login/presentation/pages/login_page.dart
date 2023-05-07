import 'package:dragon_food/features/login/data/data_sources/remote_data_source.dart';
import 'package:dragon_food/features/login/data/repositories/repository_impl.dart';
import 'package:dragon_food/features/login/domain/use_cases/login.dart';
import 'package:dragon_food/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final login = Login(RepositoryImpl(AppHttpClientLogin(http.Client())));
  final _bloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _bloc,
      listener: (context, state) {
        if (state is LoginFailure) {
          debugPrint(state.message);
        }
        if (state is LoginException) {
          debugPrint(state.message);
        }
        if (state is LoginLoaded) {
          debugPrint('gollll');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF141414),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Image.asset('assets/logo/Logo.png'),
                  const SizedBox(height: 40),
                  const Text('Login',
                      style: TextStyle(color: Color(0XFFE5E1E1), fontSize: 20)),
                  const SizedBox(height: 40),
                  TextFormField(
                    style: const TextStyle(color: Color(0XFFE5E1E1)),
                    cursorColor: const Color(0xFFE5E1E1),
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF474747),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0),
                        ),
                        focusColor: Colors.amber,
                        hintText: 'Login',
                        hintStyle: TextStyle(color: Color(0xFFE5E1E1))),
                    controller: controllerEmail,
                  ),
                  const SizedBox(height: 18),
                  TextFormField(
                    style: const TextStyle(color: Color(0XFFE5E1E1)),
                    cursorColor: const Color(0xFFE5E1E1),
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF474747),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0),
                        ),
                        hintText: 'Senha',
                        hintStyle: TextStyle(color: Color(0xFFE5E1E1))),
                    controller: controllerPassword,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (state is LoginLoad) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffF1CE39),
                          ),
                        );
                      }

                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(120, 28),
                            backgroundColor:
                                const Color(0xffF1CE39), // Background color
                          ),
                          /* style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ), */
                          onPressed: () {
                            _bloc.add(Auth(
                                controllerEmail.text, controllerPassword.text));
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Color(0xFF141414)),
                          ));
                    },
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(156, 28),
                        backgroundColor:
                            const Color(0xffF1CE39), // Background color
                      ),
                      /* style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ), */
                      onPressed: () {
                        _bloc.add(Auth(
                            controllerEmail.text, controllerPassword.text));
                      },
                      child: const Text(
                        'Me Cadastrar',
                        style: TextStyle(color: Color(0xFF141414)),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
