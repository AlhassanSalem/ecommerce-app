import 'package:ecommerce_app/core/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.shopping_basket_rounded),
            title: Text('Name Product',style: Styles.textStyle16,),
            subtitle: Text('Info about product',style: Styles.textStyle14,),
          );
        },
      ),
    );
  }
}
