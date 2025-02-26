import 'package:ex_project/router_name.dart';
import 'package:ex_project/sign_up/validator.dart';
import 'package:flutter/material.dart';

import 'common_text_field.dart';
import 'login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscureTextPassword = true;
  bool checkboxes = false;
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
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    /// Phone number input
                    CommonTextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value){
                        return phoneValidator(value);
                      },
                      hintText: 'Phone number',
                      focusNode: FocusNode(),
                    ),
                    /// Password input
                    CommonTextField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value){
                        return passwordValidator(value);
                      },
                      hintText: 'Password',
                      focusNode: FocusNode(),
                      obscureText: obscureTextPassword,

                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12,),
            /// remember -- forgot
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: checkboxes,
                        onChanged: (value) {
                          setState(() {
                            checkboxes = !checkboxes;
                          });
                        },
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ]
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouterName.forgot_password_1);
                    },
                    child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Color(0xFFAD3F32),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFAD3F32),
                          decorationThickness: 1.5,
                        )
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12,),
            /// SIGN UP
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: LoginButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Form is valid, ${_formKey.currentState?.validate()}'),
                    )
                    );
                    Navigator.pushNamed(context, '/happy_deals');
                  }
                },
                title: 'Login',
              ),
            ),
            /// TEXT BUTTON
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouterName.sign_up_page,
                  );
                },
                child: const Text(
                  'New here? Register',
                  style: TextStyle(
                    color: Color(0xFFAD3F32),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFAD3F32),
                    decorationThickness: 1.5,
                  )
                ),
            )
          ],
        ),
      ),
    );
  }
}
