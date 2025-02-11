import 'package:ecommerce_app/database/DbController.dart';
import 'package:ecommerce_app/models/user.dart';

class UserDbController {
  //LOGIN , REGISTER

  final database = DbController().database;

  void login(String email, String password) async{
    List<Map<String, dynamic>> rowsMap = await database.query(
      User.tableName,
      where: 'email = ? AND password = ?',
      whereArgs: [email,password]
    );

    if(rowsMap.isNotEmpty) {
      User user = User.fromMap(rowsMap.first);
      //Shared Preference Code...
    }
  }

  void register(User user) async{
    if(await _isEmailExist(email: user.email)){
      int newRowId = await database.insert(User.tableName, user.toMap(),);
    }

  }

  Future<bool> _isEmailExist({required String email}) async{
    List<Map<String,dynamic>> rowsMap = await database.query(User.tableName, where: 'email = ?', whereArgs: [email]);

    return rowsMap.isEmpty;
  }
}
