import 'package:ecommerce_app/database/db_oprations.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/sharedPreferences/shared_pref.dart';

class CartDbController extends DbOperation<Cart>{
  int userId = SharedPrefController().getValueFor<int>(key: PrefKeys.id)!;
  @override
  Future<int> create(Cart model) async{
    return await database.insert(Cart.tableName, model.toMap());
  }

  @override
  Future<bool> delete(int id) async{
    return await database.delete(Cart.tableName, where: 'id = ? AND user_id = ?' , whereArgs: [id, userId]) == 1;
  }

  @override
  Future<List<Cart>> read() async{
    List<Map<String,dynamic>> rowsMap = await database.query(Cart.tableName, where: 'user_id = ? ', whereArgs: [userId]);
    return rowsMap.map((rowsMap) => Cart.fromMap(rowsMap)).toList();
  }

  @override
  Future<int> update(Cart model) async{
    return await database.update(Cart.tableName, model.toMap(), where: 'user_id = ?', whereArgs: [userId]);
  }

}