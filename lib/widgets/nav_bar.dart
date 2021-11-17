import 'package:adminfo_new/adminfo_icons.dart';

import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 20,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Adminfo.menu),
              label: 'menu',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Adminfo.empresas),
              label: 'ajustes',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Adminfo.notificaciones),
              label: 'notificaciones',
              backgroundColor: Colors.black26,
            ),
            BottomNavigationBarItem(
                icon: Icon(Adminfo.notificaciones),
                label: 'notificaciones',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Adminfo.perfil),
              label: 'perfil',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
      )
    ]);
  }
}
