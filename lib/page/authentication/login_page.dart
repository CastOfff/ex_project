import 'package:ex_project/page/authentication/validator.dart';
import 'package:ex_project/router/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login bloc/login_bloc.dart';
import '../../core/widget/common_text_field.dart';
import '../../core/widget/verify_common_button.dart';
import '../../data/local_storage/user_preferences.dart';
import '../../data/model/user.dart';
import '../../data/repository/user_service.dart';

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
  final _userPreferences = UserPreferences();
  late User user1;
  @override
  void initState() {
    user1 = _userPreferences.getUser();
    _phoneController.text = user1.phone ?? '';
    _passwordController.text = user1.password ?? '';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (BuildContext context) {
        return LoginBloc(
          userService: UserService(),
          userPreferences: UserPreferences(),
        );
      },
      child: Scaffold(
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
                        Navigator.pushNamed(context, RouterName.getOTP);
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

              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    Navigator.pushReplacementNamed(context, RouterName.homePage);
                  } else if (state is LoginFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login failed: ${state.error}')),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } 
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: VerifyCommonButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<LoginBloc>().add(
                            LoginButtonPress(
                              phone: _phoneController.text,
                              password: _passwordController.text,
                            ),
                          );
                        }
                      },
                      title: 'Login',
                    ),
                  );
                }
              ),
              /// TEXT BUTTON
              TextButton(
                  onPressed: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      RouterName.signUpPage
                    );
      
                    if (result != null && result is String){
                      setState(() {
                        _phoneController.text = result;
                      });
                    }
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
      ),
    );
  }
}
