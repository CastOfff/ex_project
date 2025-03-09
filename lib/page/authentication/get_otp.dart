import 'package:ex_project/page/authentication/validator.dart';
import 'package:flutter/material.dart';
import '../../core/widget/common_text_field.dart';
import '../../core/widget/verify_common_button.dart';
import '../../router/router_name.dart';

class GetOTP extends StatefulWidget {
  const GetOTP({super.key});

  @override
  State<GetOTP> createState() => _GetOTPState();
}

class _GetOTPState extends State<GetOTP> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

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
            Image.asset('assets/images/forgot_password_1.png'),
            const SizedBox(
              height: 26,
            ),
            const Text(
              'FORGOT PASSWORD',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF483232)),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'We will send you an OTP on \n your phone number',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF483232)),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: CommonTextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    return phoneValidator(value);
                  },
                  hintText: 'Enter your phone number',
                  focusNode: FocusNode(),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),

            /// GET OTP
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: VerifyCommonButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.pushNamed(context, RouterName.verifyOTP);
                  }
                },
                title: 'GET OTP',
              ),
            ),

            /// TEXT BUTTON
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Return to Log in',
                  style: TextStyle(
                    color: Color(0xFFAD3F32),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFAD3F32),
                    decorationThickness: 1.5,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
