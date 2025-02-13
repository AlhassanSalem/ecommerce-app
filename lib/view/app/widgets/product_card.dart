
import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/extension/extension_context.dart';
import 'package:ecommerce_app/core/styles.dart';
import 'package:ecommerce_app/models/process_response.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/provider/product_provider.dart';
import 'package:ecommerce_app/view/app/widgets/operations_on_products_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,

  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToProductUpdate(context,product),
      child: Container(
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
                onPressed: () => _deleteProduct(context,product.id),
                icon: const Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.redAccent,
                ))
          ],
        ),
      ),
    );
  }

  void _deleteProduct(BuildContext context,int id) async{
    ProcessResponse response = await Provider.of<ProductProvider>(context,listen: false).delete(product.id);
    context.showSnakBar(message: response.message, success: response.success);
  }


  void _navigateToProductUpdate(BuildContext context, Product product) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return OperationsOnProductsViewBody(product: product,);
    },));
  }
}