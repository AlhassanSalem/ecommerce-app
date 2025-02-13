
import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/extension/extension_context.dart';
import 'package:ecommerce_app/core/styles.dart';
import 'package:ecommerce_app/models/process_response.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.index,
  });

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      margin: EdgeInsets.symmetric(vertical: 3.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.shopping_basket_rounded),
          SizedBox(
            width: 8.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: Styles.textStyle16,
              ),
              Text(
                product.info,
                style: Styles.textStyle14,
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Text(
                    'Price: ${product.price}\$',
                    style: Styles.textStyle14.copyWith(height: 1.1.h),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'Quantity: ${product.quantity}',
                    style: Styles.textStyle14.copyWith(height: 1.1.h),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart, color: kPrimaryColor)),
          IconButton(
              onPressed: () => _deleteProduct(context,index),
              icon: const Icon(
                Icons.delete_outline_outlined,
                color: Colors.redAccent,
              ))
        ],
      ),
    );
  }

  void _deleteProduct(BuildContext context,int index) async{
    ProcessResponse response = await Provider.of<ProductProvider>(context).delete(index);
    context.showSnakBar(message: response.message, success: response.success);
  }
}