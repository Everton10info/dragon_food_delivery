import 'package:dragon_food/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../injection_container.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashBloc bloc;
  String description = '';
  @override
  void initState() {
    bloc = getIt<SplashBloc>();
    bloc.add(FindProductsEvent());

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
    _startScreenNavigatorTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141414),
      body: Center(
        child: Image.asset('assets/logo/Logo.png'),
      ),
    );
  }

  Future<void> _startScreenNavigatorTimer() async {
    await Future.delayed(const Duration(seconds: 3));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    if (mounted) {
      Navigator.of(context).pushReplacementNamed(
        '/home-page',
      );
    }
  }
}
