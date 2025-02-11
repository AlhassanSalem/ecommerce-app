import 'package:ecommerce_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum PrefKeys {id,name,email,loggedIn}
class SharedPrefController{


  static SharedPrefController? _instance;
  late SharedPreferences _preferences;

  SharedPrefController._();

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }


  void initPref() async{
    _preferences = await SharedPreferences.getInstance();
  }

  void save(User user) {
    _preferences.setString(PrefKeys.name.name,user.name);
    _preferences.setString(PrefKeys.email.name,user.email);
    _preferences.setInt(PrefKeys.id.name,user.id);
    _preferences.setBool(PrefKeys.loggedIn.name,true);
  }

  T? getValueFor<T>({required PrefKeys key, T? defaultValue}){
    if(_preferences.containsKey(key.name)){
      return _preferences.get(key.name) as T;
    }
    return defaultValue as T;
  }

  void removeValueFor({required PrefKeys key}){
    _preferences.remove(key.name);
  }

  void clear() {
    _preferences.clear();
  }


}