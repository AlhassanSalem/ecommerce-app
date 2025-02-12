import 'package:ecommerce_app/provider/product_provider.dart';
import 'package:ecommerce_app/view/splash_view.dart';
import 'package:ecommerce_app/view/widgets/splash_view_body.dart';
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
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ProductProvider(),
            )
          ],
          child: MaterialApp(
            initialRoute: '/splash_view',
            routes: {
              '/splash_view': (context) => const SplashView(),
              '/splash_view_body': (context) => const SplashViewBody(),
            },
          ),
        );
      },
    );
  }
}
