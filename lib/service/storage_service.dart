import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {
  static late final SharedPreferences instance;

  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }
}

class TodoStorage {
  final String _key = 'todo';

  List<String>? load() {
    return StorageService.instance.getStringList(_key);
  }

  void save(List<String> data) {
    StorageService.instance.setStringList(_key, data);
  }
}

class FilterStorage {
  final String _key = 'filter';

  bool? load() {
    return StorageService.instance.getBool(_key);
  }

  void save(bool data) {
    StorageService.instance.setBool(_key, data);
  }
}

class LocaleStorage {
  final String _key = 'language';

  String? load() {
    return StorageService.instance.getString(_key);
  }

  void save(String data) {
    StorageService.instance.setString(_key, data);
  }
}

class ThemeStorage {
  final String _key = 'theme';

  bool? load() {
    return StorageService.instance.getBool(_key);
  }

  void save(bool data) {
    StorageService.instance.setBool(_key, data);
  }
}