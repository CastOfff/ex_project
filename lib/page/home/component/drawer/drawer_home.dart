
import 'package:ex_project/page/home/component/drawer/drawer_login.dart';
import 'package:flutter/material.dart';

import 'drawer_logout.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final drawerWidth = screenWidth * 5 / 6;
    return Drawer(
      width: drawerWidth,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: DrawerLogout(),
      ),
    );
  }
}
