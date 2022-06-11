import 'package:shared_preferences/shared_preferences.dart';

class Storage {

  String str = '';
  late SharedPreferences cookie;

  Storage() {
    print ('Storage() initialized...');
    init();
  }

  Future init() async {
    cookie = await SharedPreferences.getInstance();
  }  

}