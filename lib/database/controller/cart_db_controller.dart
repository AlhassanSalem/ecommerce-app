import 'package:ecommerce_app/database/db_oprations.dart';
import 'package:ecommerce_app/models/cart.dart';

class CartDbController extends DbOperation<Cart>{
  @override
  Future<int> create(Cart model) async{
    return await database.insert(Cart.tableName, model.toMap());
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Cart>> read() {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<int> update(Cart model) {
    // TODO: implement update
    throw UnimplementedError();
  }

}