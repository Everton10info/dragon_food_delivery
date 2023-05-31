import 'package:dragon_food/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/product.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late CategoriesBloc _bloc;
  late List<Product> listCategories;
  @override
  void initState() {
    _bloc = getIt<CategoriesBloc>();
    _bloc.add(const FindCategoryEvent(category: 'lanche'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff141414),
        body: Stack(children: [
          Image.asset('assets/images/lanche_header.png'),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 158),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xfff2f2f2),
                    )),
                const Text(
                  'Lanches',
                  style: TextStyle(color: Color(0xfff2f2f2)),
                )
              ],
            ),
          ),
          BlocBuilder<CategoriesBloc, CategoriesState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is CategoryLoaded) {
                print(state.listCategory.first.title);
                final list = state.listCategory;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Text(
                      list[index].title,
                      style: TextStyle(color: Colors.white),
                    );
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          )
        ]),
      ),
    );
  }
}
