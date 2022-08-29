import 'package:flutter/material.dart';
import 'package:qoute_2/models/qoute_class.dart';
import 'package:shared_preferences/sha r
class DataProvider extends ChangeNotifier {
  Future<SharedPreferences> save = SharedPreferences.getInstance();
  List qoutes = []; 
  List<String> favorate = [];
  String selected = '';

}  void textSelected(String qoute) {
   selected = qoute;
    notifyListeners();
  }

  void retreive() async {
    final SharedPreferences _save = await save;
    favorate = _save.getStringList('saved') ?? [];
  }

  int liked(String qoute) {
    if (favorate.contains(qoute)) {
      return 1;
    }
    return -1;
  }

  void saveQoute(String qoute) async {
    final SharedPreferences _save = await save;
    favorate = _save.getStringList('saved') ?? [];

    if (!favorate.contains(qoute)) {
      favorate.add(qoute);
      _save.setStringList('saved', favorate);
    } else {
      favorate.remove(qoute);
      _save.setStringList('saved', favorate);
      print(qoute);
    }
    print(favorate);
    notifyListeners();
  }
}
