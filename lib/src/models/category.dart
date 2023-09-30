import 'package:isar/isar.dart';

part 'category.g.dart';

@collection
@Name("categories")
class Category {
  int get isarId => Isar.fastHash(id);
  String id;
  @Index(unique: true)
  String name;
  String? description;
  List<String> images;
  bool status;
  DateTime? createdAt = DateTime.now();
  DateTime? updatedAt;

  Category({
    required this.id,
    required this.name,
    this.description,
    this.images = const [],
    this.status = true,
    this.createdAt,
    this.updatedAt,
  });
}