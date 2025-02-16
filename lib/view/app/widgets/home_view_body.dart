import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/styles.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/provider/product_provider.dart';
import 'package:ecommerce_app/sharedPreferences/shared_pref.dart';
import 'package:ecommerce_app/view/app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context,listen: false).read();
  }
  @override
  Widget build(BuildContext context) {
    final List<Product> products = Provider.of<ProductProvider>(context).products;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
        actions: [
          IconButton(
            onPressed: () => navigateToOperationsOnProduct(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToCartView(),
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.shopping_cart_outlined, color: Colors.white,),
      ),

      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }

  void _logout(BuildContext context) async {
    if (await _showLogoutDialog(context)) {
      SharedPrefController().clear();
      navigateToLogin();
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

  void navigateToLogin() {
    Future.delayed(const Duration(milliseconds: 250), () {
      Navigator.pushReplacementNamed(context, '/login_view');
    });
  }

  void navigateToOperationsOnProduct() {
    Future.delayed(const Duration(milliseconds: 250), () {
      Navigator.pushNamed(context, '/operations_on_products_view');
    });
  }

  void navigateToCartView(){
    Navigator.pushNamed(context, '/cart_view');
  }
}





