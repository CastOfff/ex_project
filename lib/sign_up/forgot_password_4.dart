import 'package:ex_project/router_name.dart';
import 'package:flutter/material.dart';
import 'login_button.dart';

class ForgotPassword4 extends StatefulWidget {
  const ForgotPassword4({super.key});

  @override
  State<ForgotPassword4> createState() => _ForgotPassword4State();
}

class _ForgotPassword4State extends State<ForgotPassword4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6EFE8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 54, right: 54, top: 72, bottom: 18),
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(
              height: 40,
            ),
            Image.asset('assets/images/tick_xanh.png'),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Your password has been changed',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.green),
            ),
            const SizedBox(
              height: 28,
            ),
            const Text('Please login again',
                style: TextStyle(
                  color: Color(0xFFAD3F32),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(
              height: 40,
            ),

            /// LOGIN
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: LoginButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouterName.login_page,
                    (Route<dynamic> route) => false,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('New password is saved'),
                  ));
                },
                title: 'LOGIN',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
