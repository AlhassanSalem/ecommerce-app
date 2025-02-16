import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/styles.dart';
import 'package:ecommerce_app/view/app/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.delete),),
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return CartCard();
        },
      ),
    );
  }
}

