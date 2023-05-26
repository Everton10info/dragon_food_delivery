import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc bloc;

  @override
  void initState() {
    bloc = getIt<HomeBloc>();
    bloc.add(FindDailyDealEvent());

    super.initState();
  }

  final list = <Widget>[
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 120,
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
      drawer: const Drawer(
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xff141414),
      body: Container(
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
                        Expanded(
                          child: SizedBox(
                            child: state.product.cacheImage,
                          ),
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
              height: 300,
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
    );
  }
}
