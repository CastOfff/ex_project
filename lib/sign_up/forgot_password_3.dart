
import 'package:ex_project/router_name.dart';
import 'package:ex_project/sign_up/validator.dart';
import 'package:flutter/material.dart';
import 'common_text_field.dart';
import 'login_button.dart';

class ForgotPassword3 extends StatefulWidget {
  const ForgotPassword3({super.key});

  @override
  State<ForgotPassword3> createState() => _ForgotPassword4State();
}

class _ForgotPassword4State extends State<ForgotPassword3> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();
  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;
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
            Image.asset('assets/images/forgot_password_3.png'),
            const SizedBox(height: 20,),
            const Text(
              'ENTER YOUR \n NEW PASSWORD',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF483232)
              ),
            ),
            const SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0, bottom: 0.0),
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    /// Password input
                    CommonTextField(
                      controller: _newPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value){
                        return passwordValidator(value);
                      },
                      hintText: 'Password',
                      focusNode: FocusNode(),
                      obscureText: obscureTextPassword,
                    ),
                    /// Confirm password input
                    CommonTextField(
                      controller: _confirmNewPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value){
                        return confirmPasswordValidator(value, _newPasswordController.text);
                      },
                      hintText: 'Confirm password',
                      focusNode: FocusNode(),
                      obscureText: obscureTextConfirmPassword,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 36,),
            /// SAVE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: LoginButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.pushNamed(context, RouterName.forgot_password_4);
                  }
                },
                title: 'SAVE',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
