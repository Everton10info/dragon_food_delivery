import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/product.dart';
import '../bloc/categories_bloc.dart';

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

  teste() async {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff141414),
        body: Align(
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints(minWidth: 300, maxWidth: 550),
            child: Column(
              children: [
                Stack(alignment: Alignment.topCenter, children: [
                  Image.asset(
                    'assets/images/lanche_header.png',
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.18),
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
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 210, left: 8, right: 8),
                    height: MediaQuery.of(context).size.height * 0.92,
                    child: BlocBuilder<CategoriesBloc, CategoriesState>(
                      bloc: _bloc,
                      builder: (context, state) {
                        if (state is CategoryLoadedState) {
                          final list = state.listCategory;

                          return ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: SizedBox(
                                    height: 130,
                                    width: double.infinity,
                                    child: Card(
                                      color: const Color(0xff474747),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 139,
                                            alignment: Alignment.center,
                                            child: list[index].cacheImage,
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          SizedBox(
                                            width: 150,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  overflow: TextOverflow.fade,
                                                  list[index].local,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color(0xffE5E1E1),
                                                      fontSize: 16),
                                                ),
                                                const SizedBox(
                                                  width: 32,
                                                ),
                                                Text(
                                                  overflow: TextOverflow.fade,
                                                  list[index].description,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xffE5E1E1),
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  overflow: TextOverflow.fade,
                                                  'Por apenas: R\$ ${(list[index].price / 100).toStringAsFixed(2).replaceAll('.', ',')}',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xffE5E1E1),
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(
                                                  width: 32,
                                                ),
                                                list[index].deliveryPrice < 1
                                                    ? const Text(
                                                        'Entrega: Free',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Color(
                                                                0xffE5E1E1),
                                                            fontSize: 14),
                                                      )
                                                    : const SizedBox.shrink(),
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Icon(
                                                Icons.favorite_border,
                                                color: Color(0xffE5E1E1),
                                                size: 25,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
