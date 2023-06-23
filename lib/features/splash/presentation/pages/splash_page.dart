import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/splash_bloc.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff141414),
        body: BlocConsumer(
          bloc: bloc,
          listener: (context, state) {
            if (state is SplashProductsLoadedState) {
              Navigator.of(context).pushReplacementNamed('/home-page');
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
            }
          },
          builder: (BuildContext context, Object? state) {
            return Stack(children: [
              if (state is SplashInitial)
                const Center(
                  child: SizedBox(
                      height: 200,
                      width: 200,
                      child: CircularProgressIndicator(
                        color: Color(0xffF1CE39),
                      )),
                ),
              Center(
                child: Image.asset('assets/logo/Logo.png'),
              ),
            ]);
          },
        ));
  }
}
