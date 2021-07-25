import 'package:amiibo_list/model/amiibo_for_list.dart';
import 'package:amiibo_list/repositories/api_repository.dart';
import 'package:flutter/cupertino.dart';

class MainViewModel with ChangeNotifier {

  List<AmiiboForList> list;

  Future<void> getList() async {
    try{
      list = await ApiRepository().getList();
    } catch(e){
      print(e);
    }
    notifyListeners();
  }


}