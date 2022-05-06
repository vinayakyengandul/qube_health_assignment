import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qube_health_assignment/binding.dart';
import 'package:qube_health_assignment/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Alegreya Sans',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
