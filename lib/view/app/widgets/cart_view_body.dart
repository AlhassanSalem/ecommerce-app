import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/styles.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/view/app/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CartProvider>(context,listen: false).read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        actions: [
          IconButton(
            onPressed: () => clearCart(),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, CartProvider value, child) {
          if (value.cartItem.isNotEmpty) {
            return ListView.builder(
              itemCount: value.cartItem.length,
              itemBuilder: (context, index) {
                return CartCard(cart: value.cartItem[index], index:index,);
              },
            );
          } else {
            return Center(
              child: Text(
                'Empty Card',
                style: Styles.textStyle20.copyWith(
                  color: kPrimaryColor.withOpacity(0.18),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void clearCart(){
    Provider.of<CartProvider>(context,listen: false).clear();
  }
}
