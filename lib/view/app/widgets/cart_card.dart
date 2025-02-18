import 'package:ecommerce_app/core/extension/extension_context.dart';
import 'package:ecommerce_app/core/styles.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/process_response.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.cart,
    required this.index,
  });
  final Cart cart;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: () => deleteItemFromCartById(context,cart.id),
            icon: const Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
          ),
        ),
        Container(
          padding:
              EdgeInsetsDirectional.symmetric(vertical: 25.h, horizontal: 16.w),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(.08),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          child: Row(
            children: [
              Icon(
                Icons.shopping_cart,
                color: kPrimaryColor,
                size: 50.sp,
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.nameProduct,
                    style: Styles.textStyle14.copyWith(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        'Quantity: ${cart.count}',
                        style: Styles.textStyle14.copyWith(
                          height: 1.6.h,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'total: ${cart.total}',
                        style: Styles.textStyle14.copyWith(
                          height: 1.6.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => changeQuantity(context,++cart.count),
                      padding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      icon: const Icon(
                        Icons.add,
                        size: 18,
                      ),
                    ),
                    Text(
                      '${cart.count}',

                      style: Styles.textStyle14,
                    ),
                    IconButton(
                      onPressed: () => changeQuantity(context,--cart.count),
                      padding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      icon: const Icon(
                        Icons.remove,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void deleteItemFromCartById(BuildContext context,int id) async {
    ProcessResponse response = await Provider.of<CartProvider>(context,listen: false).delete(id);
    context.showSnakBar(message: response.message, success: response.success);
  }

  void changeQuantity(BuildContext context,int count){
    Provider.of<CartProvider>(context,listen: false).changeQuantity(index,count);
  }


}
