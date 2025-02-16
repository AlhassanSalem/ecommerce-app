import 'package:ecommerce_app/database/controller/cart_db_controller.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier{
  List<Cart> _cartItems = <Cart>[];
  final CartDbController _controller = CartDbController();

  List<Cart> get cartItem => _cartItems;

  void create(Cart model) async{
    bool isNotExist = _cartItems.indexWhere((cartItem) => cartItem.id == model.id) == -1;

    if(isNotExist){
      int newRowId = await _controller.create(model);
      model.id = newRowId;
      _cartItems.add(model);
    }else {
      int index = _cartItems.indexWhere((cartItem) => cartItem.id == model.id);
      changeQuantity(index,model.count);
    }
  }

  void changeQuantity(int index, count) {
    if(count > 1){
      // count
    }
  }

  void read() async{
    _cartItems = await _controller.read();
    notifyListeners();
  }

  void delete(id) async{
    bool isDeleted = await _controller.delete(id);
    if(isDeleted){
      int index = _cartItems.indexWhere((cartItem) => cartItem.id == id);
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }



}