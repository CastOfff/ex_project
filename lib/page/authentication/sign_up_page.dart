import 'package:ex_project/data/repository/user_service.dart';
import 'package:ex_project/page/authentication/validator.dart';
import 'package:ex_project/router/router_name.dart';
import 'package:flutter/material.dart';

import '../../core/constants/color.dart';
import '../../core/widget/common_text_field.dart';
import '../../core/widget/verify_common_button.dart';
import '../../data/local_storage/user_preferences.dart';
import '../../data/model/user.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _userPreferences = UserPreferences();
  late User user1;
  final _formKey = GlobalKey<FormState>();
  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;

  @override
  void initState() {
    user1 = _userPreferences.getUser();
    _nameController.text = user1.name ?? '';
    _phoneController.text = user1.phone ?? '';
    _emailController.text = user1.email ?? '';
    _passwordController.text = user1.password ?? '';
    _confirmPasswordController.text = user1.password ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    ///Name input
                    CommonTextField(
                      controller: _nameController,
                      validator: (value){
                        return nameValidator(value);
                      },
                      hintText: 'Full name',
                      keyboardType: TextInputType.name,
                      focusNode: FocusNode(),
                    ),
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
                    /// Email input
                    CommonTextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        return emailValidator(value);
                      },
                      hintText: 'Email',
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
                    /// Confirm password input
                    CommonTextField(
                      controller: _confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value){
                        return confirmPasswordValidator(value, _passwordController.text);
                      },
                      hintText: 'Confirm password',
                      focusNode: FocusNode(),
                      obscureText: obscureTextConfirmPassword,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16,),
            /// SIGN UP
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: VerifyCommonButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    user1.name = _nameController.text;
                    user1.phone = _phoneController.text;
                    user1.email = _emailController.text;
                    user1.password = _passwordController.text;
                    Navigator.pushReplacementNamed(context, RouterName.loginPage);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Form is valid, ${_formKey.currentState?.validate()}'),
                    ));
                    await _userPreferences.saveUser(user1);
                    await UserService().createUser(user1);
                  }
                },
                title: 'Sign up',
              ),
            ),

            /// TEXT BUTTON
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                  'Already have account? Login',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: primaryColor,
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
