import 'package:realm/realm.dart';

part 'category_real_entity.g.dart';

@RealmModel()
class $_CategoryRealmEntity {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late int? iconCodePoint; // de luu icon trong Flutter
  late String? backgroundColorHex; // Color hex string
  late String? iconColorHex; // Color hex string
}
