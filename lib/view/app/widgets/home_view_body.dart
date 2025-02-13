import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/styles.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/provider/product_provider.dart';
import 'package:ecommerce_app/sharedPreferences/shared_pref.dart';
import 'package:ecommerce_app/view/app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> product = Provider.of<ProductProvider>(context).products;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
        actions: [
          IconButton(
            onPressed: () => navigateToOperationsOnProduct(context),
            icon: const Icon(
              Icons.add,
              color: kPrimaryColor,
            ),
          ),
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ProductCard(
            name: 'Product Name',
            info: '#Prodcut info...',
            price: 20.0,
            quantity: 5,
          );
        },
      ),
    );
  }

  void _logout(BuildContext context) async {
    if (await _showLogoutDialog(context)) {
      SharedPrefController().clear();
      navigateToLogin(context);
    }
  }

  Future<bool> _showLogoutDialog(BuildContext context) async {
    return await showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Text(
            'Confirem Logout',
            style: Styles.textStyle16.copyWith(color: kPrimaryColor),
          ),
          content: Text(
            'Are you sure to logout?',
            style: Styles.textStyle14,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text('No',
                  style: Styles.textStyle14.copyWith(color: kPrimaryColor)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                'Confirm',
                style: Styles.textStyle14
                    .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  void navigateToLogin(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 250), () {
      Navigator.pushReplacementNamed(context, '/login_view');
    });
  }

  void navigateToOperationsOnProduct(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 250), () {
      Navigator.pushNamed(context, '/operations_on_products_view');
    });
  }
}
