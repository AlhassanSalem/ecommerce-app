import 'package:ecommerce_app/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete, color: Colors.redAccent,),
          ),
        ),
        Container(
          padding: EdgeInsetsDirectional.symmetric(vertical: 25.h,horizontal: 16.w),
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
                    'Product Name',
                    style: Styles.textStyle14.copyWith(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        'Quantity: 10',
                        style: Styles.textStyle14.copyWith(
                          height: 1.6.h,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'total: 5',
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
                      onPressed: () {},
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
                      '1',
                      style: Styles.textStyle14,
                    ),
                    IconButton(
                      onPressed: () {},
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
}