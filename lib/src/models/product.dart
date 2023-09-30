import 'package:isar/isar.dart';
import 'package:retail_app/src/models/category.dart';

part 'product.g.dart';

@collection
@Name("products")
class Product {
  int get isarId => Isar.fastHash(id);
  String id;
  String category;
  @Ignore()
  Category? categoryData;
  @Index()
  String name;
  String? description;
  List<String> images;
  double price;
  String? discount;
  String? tax;
  bool status;
  DateTime? createdAt = DateTime.now();
  DateTime? updatedAt;

  Product({
    required this.id,
    required this.category,
    required this.name,
    this.description,
    this.images = const [],
    required this.price,
    this.discount,
    this.tax,
    this.status = true,
    this.createdAt,
    this.updatedAt,
  });
}
