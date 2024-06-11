import 'package:get_storage/get_storage.dart';

class SessionStorage {
  final GetStorage _session;

  SessionStorage() : _session = GetStorage("session");

  Future<void> write(String key, dynamic data) async {
    await _session.write(key, data);
  }

  Future<dynamic> read(String key) async {
    return await _session.read(key);
  }

  Future<void> remove(String key) async {
    await _session.remove(key);
  }

  Future<void> erase() async {
    await _session.erase();
  }
}
