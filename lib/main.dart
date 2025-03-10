import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/styles.dart';
import 'package:ecommerce_app/database/DbController.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/provider/product_provider.dart';
import 'package:ecommerce_app/sharedPreferences/shared_pref.dart';
import 'package:ecommerce_app/view/app/cart_view.dart';
import 'package:ecommerce_app/view/app/home_view.dart';
import 'package:ecommerce_app/view/app/operations_on_products_view.dart';
import 'package:ecommerce_app/view/app/splash_view.dart';
import 'package:ecommerce_app/view/app/widgets/cart_view_body.dart';
import 'package:ecommerce_app/view/app/widgets/home_view_body.dart';
import 'package:ecommerce_app/view/app/widgets/operations_on_products_view_body.dart';
import 'package:ecommerce_app/view/app/widgets/splash_view_body.dart';
import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:ecommerce_app/view/auth/register_view.dart';
import 'package:ecommerce_app/view/auth/widgets/login_view_body.dart';
import 'package:ecommerce_app/view/auth/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  await DbController().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ProductProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => CartProvider(),
            ),
          ],
          child: MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.transparent,
                titleTextStyle: Styles.textStyle18,
                centerTitle: true,
              ),
              inputDecorationTheme: InputDecorationTheme(
                labelStyle:
                    GoogleFonts.montserrat(fontSize: 12, color: Colors.black),
                hintStyle: GoogleFonts.montserrat(
                  fontSize: 12,
                ),
                alignLabelWithHint: true,
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 45.h),
                  backgroundColor: kPrimaryColor,
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  padding: const EdgeInsetsDirectional.only(
                    start: 4,
                  ),
                ),
              ),
            ),
            initialRoute: '/splash_view',
            routes: {
              '/splash_view': (context) => const SplashView(),
              '/splash_view_body': (context) => const SplashViewBody(),
              '/login_view': (context) => const LoginView(),
              '/login_view_body': (context) => const LoginViewBody(),
              '/register_view': (context) => const RegisterView(),
              '/register_view_body': (context) => const RegisterViewBody(),
              '/home_view': (context) => const HomeView(),
              '/home_view_body': (context) => const HomeViewBody(),
              '/operations_on_products_view': (context) =>
                  const OperationsOnProductsView(),
              '/operations_on_products_view_body': (context) =>
                  const OperationsOnProductsViewBody(),
              '/cart_view': (context) => const CartView(),
              '/cart_view_body': (context) => const CartViewBody(),
            },
          ),
        );
      },
    );
  }
}
