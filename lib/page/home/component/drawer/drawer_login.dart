
import 'package:ex_project/router/router_name.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/color.dart';
import '../../../../data/local_storage/user_preferences.dart';
import '../../../../data/model/user.dart';
import 'component/action_button.dart';
import 'component/avatar_widget.dart';
import 'component/info.dart';

class DrawerLogin extends StatefulWidget {
  final User? user;
  const DrawerLogin({super.key, required this.user});

  @override
  State<DrawerLogin> createState() => _DrawerLoginState();
}

class _DrawerLoginState extends State<DrawerLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        spacing: 20,
        children: [
          const SizedBox(height: 20,),
          Center(child: Image.asset('assets/images/logo.png')),
          AvatarWidget(
            titleButton: 'Edit profile',
            name: widget.user?.name ?? '',
            onPressed: () {
              Navigator.pushNamed(context, '/edit_profile_page');
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
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
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  ActionButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context,
                          RouterName.reservationHistoryPage
                      );
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
                    onPressed: () async{
                      // await UserPreferences().removeUser();
                      await UserPreferences().saveLoginStatus(false);
                      Navigator.pushReplacementNamed(context, RouterName.loginPage);
                    },
                    title: 'Log out',
                    icon: const Icon(Icons.login_outlined,size: 22, color: primaryColor,),
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Info(),
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}
