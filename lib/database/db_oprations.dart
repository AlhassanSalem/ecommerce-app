abstract class DbController<Model>{
  //CRUD : CREATE , READ, UPDATE, DELETE

  Future<int> create(Model model);

  Future<List<Model>> read();

  Future<int> update(Model model);

  Future<bool> delete(int id);


}