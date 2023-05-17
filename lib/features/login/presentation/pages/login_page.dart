import 'package:dragon_food/core/sources/remote/client.dart';
import 'package:dragon_food/features/home/data/datas_ources/remote_data_source.dart';
import 'package:dragon_food/features/home/data/repositories/repository_impl.dart';
import 'package:dragon_food/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../injection_container.dart';
import '../../../home/domain/use_cases/find_products.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  late final LoginBloc _bloc;
  @override
  void initState() {
    _bloc = getIt<LoginBloc>();
    super.initState();
  }

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
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                constraints: const BoxConstraints(
                  maxWidth: 300,
                  minWidth: 100,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Image.asset('assets/logo/Logo.png'),
                      const SizedBox(height: 40),
                      const Text('Login',
                          style: TextStyle(
                              color: Color(0XFFE5E1E1), fontSize: 20)),
                      const SizedBox(height: 40),
                      TextFormField(
                        style: const TextStyle(color: Color(0XFFE5E1E1)),
                        cursorColor: const Color(0xFFE5E1E1),
                        decoration: const InputDecoration(
                            focusColor: Colors.amber,
                            hintText: 'Login',
                            hintStyle: TextStyle(color: Color(0xFFE5E1E1))),
                        controller: _controllerEmail,
                        validator: (value) {
                          if (value!.isNotEmpty &&
                              value.contains('@') &&
                              value.contains('.com')) {
                            return null;
                          } else {
                            return 'Preencha o campo com email válido';
                          }
                        },
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        style: const TextStyle(color: Color(0XFFE5E1E1)),
                        cursorColor: const Color(0xFFE5E1E1),
                        decoration: const InputDecoration(
                            focusColor: Colors.amber,
                            hintText: 'Senha',
                            hintStyle: TextStyle(color: Color(0xFFE5E1E1))),
                        controller: _controllerPassword,
                        validator: (value) {
                          if (value!.isNotEmpty && value.length > 7) {
                            return null;
                          } else {
                            return 'Senha precisa ter no mínimo 8 carateres';
                          }
                        },
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
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _bloc.add(Auth(_controllerEmail.text,
                                      _controllerPassword.text));
                                }
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
                          onPressed: () {
                            var t = FindProducts(
                                repository: ProductsRepositoryImpl(
                                    appHttpClient: AppHttpClientFindProducts(
                                        client: AppClient())));
                            t();
                          },
                          child: const Text(
                            'Me Cadastrar',
                            style: TextStyle(color: Color(0xFF141414)),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
