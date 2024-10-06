import 'package:flutter/material.dart';
import 'package:storeapp/utilities/enum.dart';
import 'package:storeapp/utilities/routs.dart';
import 'package:storeapp/views/widgets/main_Button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _fromKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _name = TextEditingController();
  var _authType = AuthFromType.login;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32.0),
          child: SingleChildScrollView(
            child: Form(
              key: _fromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _authType == AuthFromType.login ? "Login" : "Sign Up",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  if (_authType == AuthFromType.register)
                    TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? "please Enter your Name" : null,
                        controller: _name,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        decoration: const InputDecoration(
                          labelText: "Name",
                          hintText: "Enter your Name",
                        )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      controller: _emailController,
                      validator: (value) =>
                          value!.isEmpty ? "please Enter your Email" : null,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      decoration: const InputDecoration(
                        labelText: "Email",
                        hintText: "Enter your email",
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? "please Enter your password" : null,
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: "password",
                        hintText: "Enter your password",
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  if (_authType == AuthFromType.login)
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: const Text("Forgot your Password ?"),
                        onTap: () =>
                            Navigator.pushNamed(context, '/forgotpassword'),
                      ),
                    ),
                  const SizedBox(
                    height: 32,
                  ),
                  MainButton(
                      text:
                          _authType == AuthFromType.login ? "LOGIN" : "SIGN UP",
                      ontap: () {
                        if (_fromKey.currentState!.validate()) {
                          Navigator.pushNamed(context, AppRouts.navbarpage);
                        }
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: InkWell(
                          child: Text(_authType == AuthFromType.login
                              ? "Don't have an account ? Sign Up"
                              : "Already have an account ? Login"),
                          onTap: () {
                            _fromKey.currentState!.reset();
                            _name.clear();
                            _emailController.clear();
                            _passwordController.clear();
                            setState(() {
                              if (_authType == AuthFromType.login) {
                                _authType = AuthFromType.register;
                              } else {
                                _authType = AuthFromType.login;
                              }
                            });
                          })),
                  SizedBox(height: size.height * 0.12),
                  Center(
                    child: Text(
                      _authType == AuthFromType.login
                          ? 'Or login with social account'
                          : "Or sign up with social account",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
