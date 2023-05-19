import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      drawer: const Drawer(backgroundColor: Colors.white),
      backgroundColor: const Color(0xff141414),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Image.asset(
                'assets/logo/Logo.png',
                width: 76,
              ),
            ),
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
            SizedBox(
              width: double.infinity,
              height: 220,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Desconto do dia!',
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Image.network(
                    width: double.infinity,
                    fit: BoxFit.contain,
                    'https://github.com/Everton10info/imagens/assets/64455494/0edfe04f-4761-41b4-8184-1be6186c77fd',
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      'Combo fritas + burguer (20%)',
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                  )
                ],
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
