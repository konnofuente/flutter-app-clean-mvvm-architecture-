import 'package:mvvm_restaurant_project/presentation/resources/constant_manager.dart';
import 'package:mvvm_restaurant_project/presentation/resources/langauge.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppPreferences {
  SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);


  Future <String> getAppLangauge( ) async{
    String language = _sharedPreferences.getString(Constant.PREFS_KEY_MVVM_LANG) ?? LangaugeType.ENGLISH.getValue();
    return language;
    
  }
}
