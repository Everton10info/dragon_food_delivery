import 'package:flutter/material.dart';

class AppNavigatorBar extends StatefulWidget {
  const AppNavigatorBar({super.key});

  @override
  State<AppNavigatorBar> createState() => _AppNavigatorBarState();
}

class _AppNavigatorBarState extends State<AppNavigatorBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(7),
        topRight: Radius.circular(7),
      ),
      child: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        elevation: 8.0,
        showUnselectedLabels: true,
        unselectedItemColor: const Color(0xffffffff),
        selectedIconTheme: const IconThemeData(
          color: Colors.amber,
        ),
        backgroundColor: const Color(0xff474747).withOpacity(0.85),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/botom_bar/home.png',
              height: 24,
              color: _selectedIndex == 0 ? const Color(0xffF1CE39) : null,
            ),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/botom_bar/pedidos.png',
              height: 24,
              color: _selectedIndex == 1 ? const Color(0xffF1CE39) : null,
            ),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/botom_bar/favoritos.png',
              height: 24,
              color: _selectedIndex == 2 ? const Color(0xffF1CE39) : null,
            ),
            label: 'Favoritos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffF1CE39),
        onTap: _onItemTapped,
      ),
    );
  }
}
