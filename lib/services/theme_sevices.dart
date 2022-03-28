import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  bool _loadThemeFromBox() => _box.read(_key);
}