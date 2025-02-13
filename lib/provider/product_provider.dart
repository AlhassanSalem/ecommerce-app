import 'package:ecommerce_app/database/controller/product_db_controller.dart';
import 'package:ecommerce_app/models/process_response.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = <Product>[];
  late ProductDbController _productDbController = ProductDbController();

  List<Product> get product => _products;

  Future<ProcessResponse> create({required Product product}) async {
    int newRowId = await _productDbController.create(product);
    if (newRowId != 0) {
      product.id = newRowId;
      _products.add(product);
      notifyListeners();
    }
    return getResponse(OperationsType.added, newRowId != 0);
  }

  Future<ProcessResponse> update({required Product product}) async {
    int countOfRowsUpdated = await _productDbController.update(product);
    if(countOfRowsUpdated > 0) {
      int index = _products.indexWhere((element) => element.id == product.id);
      _products[index] = product;
      notifyListeners();
    }
    return getResponse(OperationsType.updated, countOfRowsUpdated > 0);
  }

  Future<ProcessResponse> delete(int id) async{
    bool isDeleted = await _productDbController.delete(id);

    if(isDeleted) {
      int index = _products.indexWhere((element) => element.id == id);
      _products.removeAt(index);
      notifyListeners();
    }
    return getResponse(OperationsType.deleted, isDeleted);
  }

  ProcessResponse getResponse(OperationsType type , bool conditionForSuccess){
    return ProcessResponse(
      message: conditionForSuccess
          ? 'Product ${type.name} successfully'
          : 'Product ${type.name} failed',
      success: conditionForSuccess,
    );
  }

}
enum OperationsType{added,updated,deleted}
