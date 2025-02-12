import 'package:ecommerce_app/view/splash_view.dart';
import 'package:ecommerce_app/view/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: '/splash_view',
      routes: {
        '/splash_view' : (context) => const SplashView(),
        '/splash_view_body' : (context)=> const SplashViewBody(), 
      },
    );
  }
}

