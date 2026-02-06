import 'package:shoppingcard/card_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
// import 'cart_model.dart';

class CartDatabase {
  static final CartDatabase instance = CartDatabase._init();
  static Database? _database;

  CartDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('cart.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productId TEXT,
        productName TEXT,
        initialPrice INTEGER,
        productPrice INTEGER,
        quantity INTEGER,
        unitTag TEXT,
        image TEXT
      )
    ''');
  }

  // 👉 Add item to cart
  Future<int> addToCart(Cart cart) async {
    final db = await instance.database;
    return await db.insert('cart', cart.toMap());
  }

  // 👉 Get all cart items
  Future<List<Cart>> getCartItems() async {
    final db = await instance.database;
    final result = await db.query('cart');

    return result.map((json) => Cart.fromMap(json)).toList();
  }

  // 👉 Delete single item
  Future<int> deleteItem(int id) async {
    final db = await instance.database;
    return await db.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // 👉 Clear whole cart
  Future<void> clearCart() async {
    final db = await instance.database;
    await db.delete('cart');
  }
}
