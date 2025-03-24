import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../network/end_points.dart';

//secured flutter storage

class StorageHelper {
  final storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Future saveToken(String token) async {
    await storage.write(key: ApiKeys.token, value: token);
  }

  Future saveId(String id) async {
    await storage.write(key: ApiKeys.id, value: id);
  }

  dynamic getToken({required String key}) {
    return storage.read(key: key);
  }

  dynamic getId({required String key}) {
    return storage.read(key: key);
  }

  Future removeToken() async {
    await storage.delete(key: ApiKeys.token);
  }
}
