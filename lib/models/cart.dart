class Cart {
  late int id;
  late double total;
  late double price;
  late int count;
  late int userId;
  late int productId;

  static const String tableName = 'cart';

  Cart();

  /// READ ROW DATA FROM DATABASE TABLE
  Cart.fromMap(Map<String,dynamic> rowMap) {
    id = rowMap['id'];
    total = rowMap['total'];
    price = rowMap['price'];
    count = rowMap['count'];
    userId = rowMap['user_id'];
    productId = rowMap['product_id'];
  }

  /// PREPARE MAP TO BE SAVED IN DATABASE
  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = <String,dynamic>{};
    map['total'] = total;
    map['price'] = price;
    map['count'] = count;
    map['user_id'] = userId;
    map['product_id'] =productId;
    return map;
  }
}