import 'package:get_storage/get_storage.dart';

abstract class SessionStorage {
  final session = GetStorage("session");

  SesstionStorage() {
    session;
  }

  void write({required String key, required dynamic data}) {
    session.write(key, data);
  }

  dynamic read({required String key}) {
    return session.read(key);
  }

  void remove({required String key}) {
    session.remove(key);
  }

  void erase() {
    session.erase();
  }
}
