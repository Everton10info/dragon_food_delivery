import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/menu/app_navigator_bootom.dart';
import '../../../../injection_container.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc bloc;
  late List<Widget> list;
  @override
  void initState() {
    bloc = getIt<HomeBloc>();
    bloc.add(FindDailyDealEvent());
    bloc.add(VerifyAuth());

    list = <Widget>[
      InkWell(
        onTap: () => Navigator.of(context).pushNamed('/categories-page'),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/lanches.png',
                width: 90,
              ),
              const SizedBox(
                height: 4,
              ),
              const Center(
                child: Text(
                  'Lanches',
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/burguer.png',
              width: 90,
            ),
            const SizedBox(
              height: 4,
            ),
            const Center(
              child: Text(
                'Hamburguer',
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/salada .png',
              width: 90,
            ),
            const SizedBox(
              height: 4,
            ),
            const Center(
              child: Text(
                'Saladas',
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/pizza .png',
              width: 90,
            ),
            const SizedBox(
              height: 4,
            ),
            const Center(
              child: Text(
                'Pizzas',
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/sushi .png',
              width: 90,
            ),
            const SizedBox(
              height: 4,
            ),
            const Center(
              child: Text(
                'Sushi',
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/massa .png',
              width: 90,
            ),
            const SizedBox(
              height: 4,
            ),
            const Center(
              child: Text(
                'Massas',
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/doces.png',
              width: 90,
            ),
            const SizedBox(
              height: 4,
            ),
            const Center(
              child: Text(
                'Doces',
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/marmitex .png',
              width: 90,
            ),
            const SizedBox(
              height: 4,
            ),
            const Center(
              child: Text(
                'Marmitex',
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/lanches.png',
              width: 90,
            ),
            const SizedBox(
              height: 4,
            ),
            const Center(
              child: Text(
                'Lanches',
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            )
          ],
        ),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 110,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Image.asset(
                'assets/logo/Logo.png',
                width: 90,
              ),
            ),
          ],
        ),
        drawer: SizedBox(
          height: MediaQuery.of(context).size.height - 40,
          child: Drawer(
            surfaceTintColor: const Color(0xffFEB055),
            backgroundColor: const Color(0xffFEB055),
            elevation: 10,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  color: const Color(0xff191414),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/logo/Logo.png',
                        width: 75,
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/Perfil.png',
                            width: 50,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            'Olá! Dragon Food!',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Image.asset('assets/images/Onda background.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context)
                            .popAndPushNamed('/login-page'),
                        child: Row(
                          children: [
                            Image.asset('assets/icons/celular.png'),
                            const SizedBox(
                              width: 24,
                            ),
                            const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/shopping_bag.png',
                            width: 18,
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          const Text(
                            'Pedidos',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/Favoritos.png',
                            width: 19,
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          const Text(
                            'Favoritos',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/politica_privacidade.png',
                            width: 19,
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          const Text(
                            'Política de privacidade',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                      const Divider(
                        color: Color(0xff191414),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/exit.png',
                              width: 19,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Sair',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        backgroundColor: const Color(0xff141414),
        body: Container(
          constraints: const BoxConstraints(minWidth: 300, maxWidth: 550),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                maxLength: 24,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  suffix: InkWell(
                    child: const Icon(Icons.search_rounded),
                    onTap: () {},
                  ),
                  hintText: 'Search',
                  focusedErrorBorder: InputBorder.none,
                  errorStyle: const TextStyle(color: Colors.amber),
                  filled: true,
                  fillColor: const Color(0xfff2f2f2),
                  focusedBorder: const UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  border: const UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Desconto do dia!',
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 180,
                child: BlocBuilder<HomeBloc, HomeState>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is FindDailyDealLoaded) {
                      return Column(
                        children: [
                          Container(
                            child: state.product.cacheImage,
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              state.product.description,
                              style: const TextStyle(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Categorias',
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.48,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(2),
                      child: list[index],
                    );
                  },
                ),
              )
            ]),
          ),
        ),
        extendBody: true,
        bottomNavigationBar: const AppNavigatorBar());
  }
}
