class User {
  late int id;
  late String name;
  late String email;
  late String password;
  static const String tableName = 'users';
  User();

  /// READ ROW DATA FROM DATABASE TABLE
  User.fromMap(Map<String,dynamic> rowMap) {
    id = rowMap['id'];
    name = rowMap['name'];
    email = rowMap['email'];
    password = rowMap['password'];
  }

  /// PREPARE MAP TO BE SAVED IN DATABASE
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;

    return map;
  }
}
