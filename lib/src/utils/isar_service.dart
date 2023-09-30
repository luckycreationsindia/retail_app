import 'package:isar/isar.dart';
import 'package:objectid/objectid.dart';
import 'package:retail_app/src/models/category.dart';
import 'package:retail_app/src/models/order.dart';
import 'package:retail_app/src/models/product.dart';
import 'package:retail_app/src/models/settings.dart';
import 'package:retail_app/src/utils/globals.dart' as globals;

class IsarService {
  IsarService() {
    db = openDB();
  }

  late Future<Isar> db;

  // Return IsarDB, if not found, then create
  Future<Isar> openDB() async {
    final db = await Isar.openAsync(
      directory: globals.appPath,
      name: 'retail_app',
      schemas: [
        SettingsSchema,
        CategorySchema,
        ProductSchema,
        OrderSchema,
      ],
    );

    final settings = db.settings.where().findFirst();
    if (settings == null) {
      await db.writeAsync((isar) async {
        return isar.settings.put(Settings(
          id: ObjectId().hexString,
          createdAt: DateTime.now(),
        ));
      });
    }

    return db;
  }

  Future<List<Category>> getAllCategories() async {
    final isar = await db;
    return isar.categorys.where().findAll();
  }

  Future<List<Product>> getAllProducts() async {
    final isar = await db;
    return isar.products.where().findAll();
  }

  Future<Settings> getSettings() async {
    final isar = await db;
    return isar.settings.where().findFirst()!;
  }

  Stream<List<Category>> listenToCategoryList() async* {
    final isar = await db;
    yield* isar.categorys.where().watch(fireImmediately: true);
  }

  Future<bool> addUpdateCategory(Category category) async {
    final isar = await db;
    await isar.writeAsync((isar) {
      return isar.categorys.put(category);
    });
    return true;
  }

  Stream<List<Product>> listenToProductList(String category) async* {
    final isar = await db;
    yield* isar.products
        .where()
        .categoryEqualTo(category)
        .watch(fireImmediately: true);
  }

  Future<bool> addUpdateProduct(Product product) async {
    final isar = await db;
    await isar.writeAsync((isar) {
      return isar.products.put(product);
    });
    return true;
  }

  Stream<List<Order>> listenToOrderList() async* {
    final isar = await db;
    yield* isar.orders.where().sortByStatus().watch(fireImmediately: true);
  }

  Future<bool> addUpdateOrder(Order order) async {
    final isar = await db;
    await isar.writeAsync((isar) {
      return isar.orders.put(order);
    });
    return true;
  }

  Future<bool> deleteOrder(String order) async {
    final isar = await db;
    await isar.writeAsync((isar) {
      return isar.orders.delete(order);
    });
    return true;
  }

  Future<bool> addUpdateSettings(Settings settings) async {
    final isar = await db;
    await isar.writeAsync((isar) {
      return isar.settings.put(settings);
    });
    return true;
  }
}

// int fastHash(String string) {
//   var hash = 0xcbf29ce484222325;
//
//   var i = 0;
//   while (i < string.length) {
//     final codeUnit = string.codeUnitAt(i++);
//     hash ^= codeUnit >> 8;
//     hash *= 0x100000001b3;
//     hash ^= codeUnit & 0xFF;
//     hash *= 0x100000001b3;
//   }
//
//   return hash;
// }
