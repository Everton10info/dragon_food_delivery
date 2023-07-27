import 'package:flutter/material.dart';

class Categories {
  static buildList(ctx) => <Widget>[
        InkWell(
          onTap: () => Navigator.of(ctx).pushNamed('/categories-page'),
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
}
