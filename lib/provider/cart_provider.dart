import 'package:ecommerce_app/database/controller/cart_db_controller.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/process_response.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> _cartItems = <Cart>[];
  final CartDbController _controller = CartDbController();

  List<Cart> get cartItem => _cartItems;

  Future<ProcessResponse> create(Cart model) async {
    int index = _cartItems.indexWhere((item) => item.id == model.id && item.productId == model.productId);
    bool isNotExist =  index== -1;
    if(isNotExist){
      int newRowId = await _controller.create(model);
      if(newRowId > 0){
        model.id = newRowId;
        model.count = 1;
        _cartItems.add(model);
        notifyListeners();
      }
      return getResponse(newRowId >0);
    }else {
      return changeQuantity(index,model.count+1);
    }

  }

  Future<ProcessResponse> changeQuantity(int index, newCount) async{
    Cart cart = _cartItems[index];
    if(newCount >= 1){
      cart.count = newCount;
      cart.total = cart.count * cart.price;
      bool isUpdated = await _controller.update(cart) > 0;
      if(isUpdated) {
        _cartItems[index] = cart;
        notifyListeners();
      }
      return getResponse(isUpdated);
    } else{
     await delete(cart.id);
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
