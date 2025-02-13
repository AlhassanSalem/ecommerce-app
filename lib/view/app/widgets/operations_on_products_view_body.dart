import 'package:flutter/material.dart';

class OperationsOnProductsViewBody extends StatefulWidget {
  const OperationsOnProductsViewBody({super.key});

  @override
  State<OperationsOnProductsViewBody> createState() => _OperationsOnProductsViewBodyState();
}

class _OperationsOnProductsViewBodyState extends State<OperationsOnProductsViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operations'),,
      )
    );
  }
}