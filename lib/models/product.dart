class Product{
  late int id;
  late String name;
  late String info;
  late double price;
  late int quantity;
  late int userId;

  static const String tableName = 'products';
  Product();

  /// READ ROW DATA FROM DATABASE TABLE
  Product.fromMap(Map<String,dynamic> rowMap){
    id = rowMap['id'];
    name = rowMap['name'];
    info = rowMap['info'];
    price = rowMap['price'];
    quantity = rowMap['quantity'];
    userId = rowMap['user_id'];
  }


  /// PREPARE MAP TO BE SAVED IN DATABASE
  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = <String,dynamic>{};
    map['name'] = name;
    map['info'] = info;
    map['price'] = price;
    map['quantity'] = quantity;
    map['quantity'] = quantity;
    map['user_id'] = userId;
    return map;
  }
}