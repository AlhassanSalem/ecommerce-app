
import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.name,
    required this.info,
    required this.price,
    required this.quantity,
  });

  final String name;
  final String info;
  final double price;
  final int quantity;

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
                name,
                style: Styles.textStyle16,
              ),
              Text(
                info,
                style: Styles.textStyle14,
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Text(
                    'Price: $price\$',
                    style: Styles.textStyle14.copyWith(height: 1.1.h),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'Quantity: $quantity',
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
              onPressed: () {},
              icon: const Icon(
                Icons.delete_outline_outlined,
                color: Colors.redAccent,
              ))
        ],
      ),
    );
  }
}