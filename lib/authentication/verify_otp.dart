
import 'package:ex_project/authentication/validator.dart';
import 'package:flutter/material.dart';
import '../router/router_name.dart';
import 'common_text_field.dart';
import 'login_button.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({super.key});

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6EFE8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 54, right: 54, top: 72, bottom: 18),
              child: Image.asset('assets/images/logo.png'),
            ),
            Image.asset('assets/images/forgot_password_2.png'),
            const SizedBox(height: 26,),
            const Text(
              'VERIFICATION',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF483232)
              ),
            ),
            const SizedBox(height: 20,),
            const Text(
              'Enter the OTP code that \n we send you via SMS',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF483232)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0, bottom: 0.0),
              child: Form(
                key: _formKey,
                child: CommonTextField(
                  controller: _otpController,
                  keyboardType: TextInputType.phone,
                  validator: (value){
                    return confirmOTPValidator(value, _otpController.text);
                  },
                  hintText: 'Enter OTP code',
                  focusNode: FocusNode(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t receivecode?',
                  style: TextStyle(
                    color: Color(0xFFAD3F32),
                    fontSize: 16,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                        color: Color(0xFFAD3F32),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                )
              ]
            ),
            /// VERIFY
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: LoginButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.pushNamed(context, RouterName.newPassWordPage);
                  }
                },
                title: 'VERIFY',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
