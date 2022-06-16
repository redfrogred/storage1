import 'package:shared_preferences/shared_preferences.dart';

class Storage {

  String name = '';
  int count = 0;
  late SharedPreferences prefs;

  Storage() {
    print ('Storage() initialized...');
    init();
  }

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }  

}