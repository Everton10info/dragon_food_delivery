import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/find_products/data/data_souces/remote/models/products_model.dart';
import '../../../../core/session/manager_session/manager_session.dart';
import '../../../../core/utils/categories.dart';
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
  late List<Widget> categories;
  @override
  void initState() {
    bloc = getIt<HomeBloc>();
    bloc.add(FindDailyDealEvent());
    categories = Categories.buildList(context);
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
          child: _buildDrawer(),
        ),
        backgroundColor: const Color(0xff141414),
        body: Container(
          constraints: const BoxConstraints(minWidth: 300, maxWidth: 550),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
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
                                    height: 150,
                                    alignment: Alignment.center,
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
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(2),
                              child: categories[index],
                            );
                          },
                        ),
                      ),
                    ]),
              ),
              ValueListenableBuilder(
                builder: (BuildContext context, value, Widget? child) {
                  return Session.user.value['authenticated']
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 90),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:
                                      const Color(0xff474747).withOpacity(0.85),
                                ),
                                height: 50,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          ' Para melhor experiência acesse sua conta',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushNamed('/login-page');
                                          },
                                          child: const Text(
                                            ' Login ou cadastro',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.red,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        );
                },
                valueListenable: Session.user,
              ),
              const SizedBox(
                height: 180,
                child: Search(),
              ),
            ],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: const AppNavigatorBar());
  }

  Widget _buildDrawer() {
    return Drawer(
      surfaceTintColor: const Color(0xffFEB055),
      backgroundColor: const Color(0xffFEB055),
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), bottomRight: Radius.circular(40)),
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
                    ValueListenableBuilder(
                      builder: (BuildContext context, value, Widget? child) {
                        return Text(
                          'Olá! ${Session.user.value['user'] ?? 'dragon food'}'
                              .toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        );
                      },
                      valueListenable: Session.user,
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
                  onTap: () =>
                      Navigator.of(context).popAndPushNamed('/login-page'),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  child: InkWell(
                    onTap: () {
                      Session.logout();

                      Navigator.of(context).pop('home-page');
                    },
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search> {
  final list = ValueNotifier(<ProductModel>[]);
  final ValueNotifier hintText = ValueNotifier('Search');
  final controller = TextEditingController();
  CachedNetworkImage? cacheImage;
  _searchProducts(String value) {
    final listTotal = ProductModel.productsCache;
    list.value =
        listTotal.where((element) => element.title.contains(value)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder(
            valueListenable: list,
            builder: (context, value, child) {
              return Column(
                children: [
                  TextFormField(
                    controller: controller,
                    maxLength: 24,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      _searchProducts(value);

                      if (value.isEmpty) list.value = [];
                    },
                    decoration: InputDecoration(
                      counter: const Offstage(),
                      suffix: InkWell(
                        child: const Icon(Icons.search_rounded),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('indo'),
                                backgroundColor: Colors.black,
                                content: Center(
                                  child: Column(
                                    children: [
                                      const LinearProgressIndicator(
                                          color: Colors.amber),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      SizedBox(
                                        height: 74,
                                        child: cacheImage,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ).then((value) => null);
                        },
                      ),
                      hintText: hintText.value,
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
                  Expanded(
                    child: ListView.builder(
                      itemCount: list.value.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            cacheImage = list.value[index].cacheImage;
                            controller.text = list.value[index].title;
                            controller.selection = TextSelection.collapsed(
                                offset: controller.text.length);
                            list.value = [];
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white60.withOpacity(0.95),
                                border: Border.all()),
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    list.value[index].title,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    textAlign: TextAlign.end,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  SizedBox(
                                    height: 24,
                                    child: list.value[index].cacheImage,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
      ],
    );
  }
}
