
class CartFields {
  static const String tableName = 'Cart';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT NOT NULL';
  static const String textTypeNULL = 'TEXT';
  static const String intType = 'INTEGER NOT NULL';
  static const String doubleType = 'REAL NOT NULL'; // Use 'REAL' for double type
  static const String id = 'id';
  static const String title = 'title';
  static const String qty = 'qty';
  static const String price = 'price';
  static const String image = 'image';
  static const String description = 'description';
  static const String createdTime = 'created_time';
}