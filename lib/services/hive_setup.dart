import 'package:hive_flutter/hive_flutter.dart';

// ignore: avoid_classes_with_only_static_members
class HiveBox {
  static late Box<dynamic> _box;

  static Future<Box<dynamic>> initBox() async {
    await Hive.initFlutter();
    // ignore: join_return_with_assignment
    _box = await Hive.openBox('storeBox');

    return _box;
  }

  static Future<void> putStuffInBox({
    required String key,
    required dynamic value,
  }) {
    return _box.put(key, value);
  }

  static Future<dynamic> getStuffFromBox({required String key}) async {
    return await _box.get(key);
  }

  static Future<void> deleteStuffFromBox({required String key}) async {
    return _box.delete(key);
  }

  static void deletBox() {
    _box.deleteFromDisk();
  }
}
