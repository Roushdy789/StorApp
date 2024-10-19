import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/controllers/Auth_controllers.dart';
import 'package:storeapp/services/auth.dart';
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
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit(AuthControllers model) async {
    try {
      await model.submit();
      if (mounted) {
        Navigator.of(context).pushNamed(AppRouts.navbarpage);
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Error"),
          content: Text("Something went wrong ${e.toString()} "),
          actions: [
            TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<AuthBase>(context);
    return SafeArea(
      child: ChangeNotifierProvider<AuthControllers>(
        create: (_) => AuthControllers(auth: auth),
        child: Consumer<AuthControllers>(builder: (_, model, __) {
          return Scaffold(
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 60, horizontal: 32.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _fromKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.authfromtype == AuthFromType.login
                            ? "Login"
                            : "Sign Up",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      // if (model.authfromtype == AuthFromType.register)
                      //   TextFormField(
                      //       validator: (value) => value!.isEmpty
                      //           ? "please Enter your Name"
                      //           : null,
                      //       controller: _name,
                      //       onEditingComplete: () =>
                      //           FocusScope.of(context).nextFocus(),
                      //       decoration: const InputDecoration(
                      //         labelText: "Name",
                      //         hintText: "Enter your Name",
                      //       )),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          controller: _emailController,
                          onChanged: model.updatEmail,
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
                          validator: (value) => value!.isEmpty
                              ? "please Enter your password"
                              : null,
                          controller: _passwordController,
                          onChanged: model.updatPassword,
                          decoration: const InputDecoration(
                            labelText: "password",
                            hintText: "Enter your password",
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      if (model.authfromtype == AuthFromType.login)
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
                          text: model.authfromtype == AuthFromType.login
                              ? "LOGIN"
                              : "SIGN UP",
                          ontap: () {
                            if (_fromKey.currentState!.validate()) {
                              //model.submit();
                              _submit(model);
                              //Navigator.pushNamed(context, AppRouts.navbarpage);
                            }
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: InkWell(
                              child: Text(
                                  model.authfromtype == AuthFromType.login
                                      ? "Don't have an account ? Sign Up"
                                      : "Already have an account ? Login"),
                              onTap: () {
                                _fromKey.currentState!.reset();
                                _name.clear();
                                _emailController.clear();
                                _passwordController.clear();
                                model.toggleFormType();
                              })),
                      SizedBox(height: size.height * 0.12),
                      Center(
                        child: Text(
                          model.authfromtype == AuthFromType.login
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
          );
        }),
      ),
    );
  }
}
