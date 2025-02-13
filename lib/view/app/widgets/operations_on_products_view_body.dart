import 'package:ecommerce_app/core/styles.dart';
import 'package:ecommerce_app/core/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OperationsOnProductsViewBody extends StatefulWidget {
  const OperationsOnProductsViewBody({super.key});

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
        title: const Text('Operations'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add new product...',
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
              onPressed: () {},
              child: Text(
                'Create',
                style: Styles.textStyle14
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
