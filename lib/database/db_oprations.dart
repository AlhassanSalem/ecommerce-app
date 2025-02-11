import 'package:ecommerce_app/database/DbController.dart';
import 'package:sqflite/sqflite.dart';

abstract class DbOperation<Model>{
  //CRUD : CREATE , READ, UPDATE, DELETE

  final Database database = DbController().database;

  Future<int> create(Model model);

  Future<List<Model>> read();

  Future<int> update(Model model);

  Future<bool> delete(int id);


}