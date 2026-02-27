import 'package:advanced_flutter/W7-Spotify-Setting/data/repositories/settings/app_settings_repository.dart';
import 'package:flutter/widgets.dart';
 
import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
 
  AppSettings? _appSettings;
  final AppSettingsRepository _repository;
 
  AppSettingsState(this._repository);

  Future<void> init() async {
    _appSettings = await _repository.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);
    await _repository.save(_appSettings!);

    notifyListeners();
  }
}
