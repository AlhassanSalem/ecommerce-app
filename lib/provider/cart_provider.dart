import 'package:ecommerce_app/database/controller/cart_db_controller.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/process_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> _cartItems = <Cart>[];
  final CartDbController _controller = CartDbController();

  List<Cart> get cartItem => _cartItems;

  Future<ProcessResponse> create(Cart model) async {
    bool isNotExist =
        _cartItems.indexWhere((cartItem) => cartItem.id == model.id) == -1;
    if (isNotExist) {
      int newRowId = await _controller.create(model);
      model.id = newRowId;
      // model.count = 1;
      _cartItems.add(model);
      return getResponse(newRowId > 0);
    } else {
      int index = _cartItems.indexWhere((cartItem) => cartItem.id == model.id);
      changeQuantity(index, model.count);
    }
    return getResponse(false);
  }

  Future<ProcessResponse> changeQuantity(int index, count) async{
    if (count > 1) {
      Cart model = _cartItems[index];
      model.count = count;
      model.total = model.count * model.price;
      bool isUpdated = await _controller.update(model) > 1;
      if(isUpdated){
        _cartItems[index] = model;
        notifyListeners();
      }
      return getResponse(isUpdated);
    } else if (count == 0) {
      delete(_cartItems[index].id);
    }
    return getResponse(false);
  }

  void read() async {
    _cartItems = await _controller.read();
    notifyListeners();
  }

  Future<ProcessResponse> delete(id) async {
    bool isDeleted = await _controller.delete(id);
    if (isDeleted) {
      int index = _cartItems.indexWhere((cartItem) => cartItem.id == id);
      _cartItems.removeAt(index);
      notifyListeners();
    }
    return getResponse(isDeleted);
  }

  ProcessResponse getResponse(bool successCondition) {
    return ProcessResponse(
      message: successCondition ? 'Operation Successfully' : 'Operation Failed',
      success: successCondition,
    );
  }
}
