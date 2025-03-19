
import 'package:ex_project/data/local_storage/user_preferences.dart';
import 'package:ex_project/page/home/component/drawer/drawer_logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/login bloc/login_bloc.dart';
import '../../../../data/model/user.dart';
import 'drawer_login.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    User user = UserPreferences().getUser();
    context.read<LoginBloc>().add(CheckLoginStatus(user: user));
    final screenWidth = MediaQuery.of(context).size.width;
    final drawerWidth = screenWidth * 5 / 6;
    return Drawer(
      width: drawerWidth,
      child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              if (state is LoginSuccess) {
                return SizedBox(
                  width: drawerWidth,
                  child: DrawerLogin(
                    user: state.user,
                  ),
                );
              } else {
                return const DrawerLogout();
              }
            }
          ),
    );
  }
}
