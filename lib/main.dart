import 'package:ecommerce_app/provider/product_provider.dart';
import 'package:ecommerce_app/view/app/splash_view.dart';
import 'package:ecommerce_app/view/app/widgets/splash_view_body.dart';
import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:ecommerce_app/view/auth/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375,812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ProductProvider(),
            )
          ],
          child: MaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.transparent,
              )
            ),
            initialRoute: '/login_view',
            routes: {
              '/splash_view': (context) => const SplashView(),
              '/splash_view_body': (context) => const SplashViewBody(),
              '/login_view': (context) => const LoginView(),
              '/login_view_body': (context) => const LoginViewBody(),
            },
          ),
        );
      },
    );
  }
}
