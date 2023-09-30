import 'package:isar/isar.dart';

part 'settings.g.dart';

@collection
@Name("settings")
class Settings {
  int get isarId => Isar.fastHash(id);
  String id;
  String lang;
  int orderNo;
  DateTime? createdAt = DateTime.now();
  DateTime? updatedAt;

  Settings({
    required this.id,
    this.lang = 'en',
    this.orderNo = 1,
    this.createdAt,
    this.updatedAt,
  });
}
