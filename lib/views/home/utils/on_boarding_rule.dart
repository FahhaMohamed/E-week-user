import 'package:shared_preferences/shared_preferences.dart';

addRule() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setBool('isOpened', true);
}
