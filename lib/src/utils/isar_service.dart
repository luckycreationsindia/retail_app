import 'package:isar/isar.dart';
import 'package:objectid/objectid.dart';
import 'package:retail_app/src/models/category.dart';
import 'package:retail_app/src/models/order.dart';
import 'package:retail_app/src/models/product.dart';
import 'package:retail_app/src/models/settings.dart';
import 'package:retail_app/src/utils/globals.dart' as globals;

class IsarService {

  Future<Isar> openDB() async {
    globals.db = Isar.open(
      directory: globals.appPath,
      name: 'retail_app',
      schemas: [
        SettingsSchema,
        CategorySchema,
        ProductSchema,
        OrderSchema,
      ],
    );

    await Future.delayed(const Duration(seconds: 1));

    final settings = globals.db.settings.where().findFirst();
    if (settings == null) {
      await addUpdateSettings(Settings(
        id: ObjectId().hexString,
        createdAt: DateTime.now(),
      ));
    }

    return globals.db;
  }

  Future<List<Category>> getAllCategories() async {
    final isar = globals.db;
    return isar.categorys.where().findAll();
  }

  Future<List<Product>> getAllProducts() async {
    final isar = globals.db;
    return isar.products.where().findAll();
  }

  Future<Settings> getSettings() async {
    final isar = globals.db;
    return isar.settings.where().findFirst()!;
  }

  Stream<List<Category>> listenToCategoryList() async* {
    final isar = globals.db;
    yield* isar.categorys.where().watch(fireImmediately: true);
  }

  Future<bool> addUpdateCategory(Category category) async {
    final isar = globals.db;
    await isar.writeAsync((isar) {
      return isar.categorys.put(category);
    });
    return true;
  }

  Stream<List<Product>> listenToProductList(String category) async* {
    final isar = globals.db;
    yield* isar.products
        .where()
        .categoryEqualTo(category)
        .watch(fireImmediately: true);
  }

  Future<bool> addUpdateProduct(Product product) async {
    final isar = globals.db;
    await isar.writeAsync((isar) {
      return isar.products.put(product);
    });
    return true;
  }

  Stream<List<Order>> listenToOrderList() async* {
    final isar = globals.db;
    yield* isar.orders.where().sortByStatus().watch(fireImmediately: true);
  }

  Future<bool> addUpdateOrder(Order order) async {
    final isar = globals.db;
    await isar.writeAsync((isar) {
      return isar.orders.put(order);
    });
    return true;
  }

  Future<bool> deleteOrder(String order) async {
    final isar = globals.db;
    await isar.writeAsync((isar) {
      return isar.orders.delete(order);
    });
    return true;
  }

  Future<bool> addUpdateSettings(Settings settings) async {
    final isar = globals.db;
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
