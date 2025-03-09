import 'package:ex_project/router/router_name.dart';
import 'package:flutter/material.dart';
import '../../core/widget/verify_common_button.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
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
              child: VerifyCommonButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouterName.loginPage,
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
