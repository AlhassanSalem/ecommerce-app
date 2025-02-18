import 'package:ecommerce_app/core/styles.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/sharedPreferences/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    _navigateToPath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Ecommerce app',
          style: Styles.textStyle20,
        ),
      ),
    );
  }

  void _navigateToPath() {
    Future.delayed(
      const Duration(milliseconds: 250),
      () {
        Navigator.pushReplacementNamed(context, navigatePath);
      },
    );
  }

  String get navigatePath {
    return SharedPrefController()
            .getValueFor<bool>(key: PrefKeys.loggedIn, defaultValue: false)!
        ? '/home_view'
        : '/login_view';
  }
}
