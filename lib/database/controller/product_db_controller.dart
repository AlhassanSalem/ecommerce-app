import 'package:ecommerce_app/database/db_oprations.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/sharedPreferences/shared_pref.dart';

class ProductDbController extends DbOperation<Product> {
  int userId = SharedPrefController().getValueFor(key: PrefKeys.id);

  @override
  Future<int> create(Product model) async {
    int newRowId = await database.insert(Product.tableName, model.toMap());
    return newRowId;
  }

  @override
  Future<bool> delete(int id) async {
    int countOfRowsDeleted = await database.delete(
      Product.tableName,
      where: 'id = ? AND user_id = ?',
      whereArgs: [id,userId]
    );

    return countOfRowsDeleted > 0;
  }

  @override
  Future<List<Product>> read() async{
    List<Map<String,dynamic>> rowsMap = await database.query(Product.tableName);
    return rowsMap.map((rowMap) => Product.fromMap(rowMap)).toList();;
  }

  @override
  Future<int> update(Product model) async{
    int countOfRowsUpdated = await database.update(Product.tableName, model.toMap());
    return countOfRowsUpdated;
  }
}
