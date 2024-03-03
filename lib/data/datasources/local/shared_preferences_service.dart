import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences prefs;

  final String _basketProductsKey = 'basketProducts';

  SharedPreferencesService(this.prefs);

  void setBasketProducts(String basketProducts) async {
    prefs.setString(_basketProductsKey, basketProducts);
  }

  Future<String?> getBasketProducts() async {
    return prefs.getString(_basketProductsKey);
  }
}
