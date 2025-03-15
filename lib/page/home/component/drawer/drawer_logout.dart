
import 'package:flutter/material.dart';

import '../../../../core/constants/color.dart';
import 'component/action_button.dart';
import 'component/avatar_widget.dart';
import 'component/info.dart';

class DrawerLogout extends StatefulWidget {
  const DrawerLogout({super.key});

  @override
  State<DrawerLogout> createState() => _DrawerLogoutState();
}

class _DrawerLogoutState extends State<DrawerLogout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        const SizedBox(height: 20,),
        Center(child: Image.asset('assets/images/logo.png')),
        AvatarWidget(
          titleButton: 'Edit profile',
          onPressed: () {
            Navigator.pushNamed(context, '/edit_profile_page');
          },
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: const BoxDecoration(
                color: primaryColor,
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: primaryColor,
                    width: 0.5,
                  ),
                  vertical: BorderSide(
                    color: primaryColor,
                    width: 1,
                  ),
                )
            ),
            child: Column(
              children: [
                ActionButton(
                  onPressed: () {
                  },
                  title: 'Home',
                  icon: const Icon(Icons.home_outlined,size: 22, color: primaryColor,),
                ),
                ActionButton(
                  onPressed: () {
                  },
                  title: 'Reservation',
                  icon: const Icon(Icons.menu,size: 22, color: primaryColor,),
                ),
                ActionButton(
                  onPressed: () {
                  },
                  title: 'Change password',
                  icon: const Icon(Icons.key_outlined,size: 22, color: primaryColor,),
                ),
                ActionButton(
                  onPressed: () {
                  },
                  title: 'About us',
                  icon: const Icon(Icons.info_outline,size: 22, color: primaryColor,),
                ),
                ActionButton(
                  onPressed: () {
                  },
                  title: 'Log out',
                  icon: const Icon(Icons.login_outlined,size: 22, color: primaryColor,),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Info(),
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}
