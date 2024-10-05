import 'package:flutter/material.dart';
import 'package:storeapp/utilities/router.dart';
import 'package:storeapp/utilities/routs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ecommerce App",
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF8F8F8),
          primaryColor: const Color(0xFFDB3022),
          inputDecorationTheme: InputDecorationTheme(
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  )),
              labelStyle: Theme.of(context).textTheme.titleSmall,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  )))),
      onGenerateRoute: generateRoute,
      initialRoute: AppRouts.loginPage,
      home: const Column(
        children: [
          Text('Hello World'),
        ],
      ),
    );
  }
}
