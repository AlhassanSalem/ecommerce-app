import 'package:ecommerce_app/core/extension/extension_context.dart';
import 'package:ecommerce_app/core/styles.dart';
import 'package:ecommerce_app/core/widgets/text_field_widget.dart';
import 'package:ecommerce_app/models/process_response.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/provider/product_provider.dart';
import 'package:ecommerce_app/sharedPreferences/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OperationsOnProductsViewBody extends StatefulWidget {
  const OperationsOnProductsViewBody({super.key, this.product});
  final Product? product;

  @override
  State<OperationsOnProductsViewBody> createState() =>
      _OperationsOnProductsViewBodyState();
}

class _OperationsOnProductsViewBodyState
    extends State<OperationsOnProductsViewBody> {
  late TextEditingController _nameController;
  late TextEditingController _infoController;
  late TextEditingController _priceController;
  late TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _infoController = TextEditingController();
    _priceController = TextEditingController();
    _quantityController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _infoController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(!_isUpdated ? 'Create Product' : 'Update Product'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              !_isUpdated ? 'Create new product...' : 'Update product',
              style: Styles.textStyle16,
            ),
            Text(
              'Enter required data below...',
              style: Styles.textStyle14,
            ),
            SizedBox(
              height: 16.h,
            ),
            TextFieldApp(
              controller: _nameController,
              lableText: 'Name',
              hintText: 'Enter your product name',
              prefix: Icons.info,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFieldApp(
              controller: _infoController,
              lableText: 'Info',
              hintText: 'Enter your product info',
              prefix: Icons.info,
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFieldApp(
                    controller: _priceController,
                    lableText: 'Price',
                    hintText: 'Enter your product price',
                    prefix: Icons.attach_money,
                    textInputType: const TextInputType.numberWithOptions(
                        signed: false, decimal: true),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: TextFieldApp(
                    controller: _quantityController,
                    lableText: 'Quantity',
                    hintText: 'Enter your product quantity',
                    prefix: Icons.numbers_outlined,
                    textInputType: const TextInputType.numberWithOptions(
                        signed: false, decimal: false),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            ElevatedButton(
              onPressed: () => _performOperation(),
              child: Text(
                !_isUpdated ? 'Create' : 'Update',
                style: Styles.textStyle14
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool get _isUpdated => widget.product != null;

  Product get product {
    Product product = Product();
    product.name = _nameController.text;
    product.info = _infoController.text;
    product.price = double.parse(_priceController.text);
    product.quantity = int.parse(_quantityController.text);
    product.userId = SharedPrefController().getValueFor(key: PrefKeys.id);
    return product;
  }

  void _performOperation() async {
    ProcessResponse response = _isUpdated
        ? await Provider.of<ProductProvider>(context, listen: false).update(
            product: product,
          )
        : await Provider.of<ProductProvider>(context, listen: false)
            .create(product: product);
    if(response.success){
      _clear();
    }
    context.showSnakBar(message: response.message, success: response.success);
  }

  void _clear(){
    _nameController.clear();
    _infoController.clear();
    _priceController.clear();
    _quantityController.clear();
  }
}


