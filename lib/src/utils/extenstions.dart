import 'package:flutter/cupertino.dart';
import 'package:retail_app/src/models/category.dart';
import 'package:retail_app/src/models/order.dart';
import 'package:retail_app/src/models/product.dart';
import 'package:retail_app/src/utils/isar_service.dart';

extension RetailAppHelper on BuildContext {
  Future<List<Category>> getAllCategories() => IsarService().getAllCategories();
  Future<bool> addCategory(Category category) => IsarService().addUpdateCategory(category);
  Future<bool> updateCategory(Category category) => addCategory(category);
  Stream<List<Category>> categoryStream() => IsarService().listenToCategoryList();
  Stream<List<Product>> productStream(String category) => IsarService().listenToProductList(category);
  Future<bool> addProduct(Product product) => IsarService().addUpdateProduct(product);
  Future<bool> updateProduct(Product product) => addProduct(product);
  Stream<List<Order>> orderStream() => IsarService().listenToOrderList();
  Future<bool> createOrder(Order order) => IsarService().addUpdateOrder(order);
  Future<bool> updateOrder(Order order) => createOrder(order);
}
