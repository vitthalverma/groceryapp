import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/cartmodel.dart';
import 'package:grocery_app/intoPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => CartModel()),
      child: GetMaterialApp(
        title: 'Grocery App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: IntroPage(),
      ),
    );
  }
}
