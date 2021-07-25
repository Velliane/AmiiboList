import 'package:amiibo_list/model/amiibo_for_list.dart';
import 'package:amiibo_list/utils/api_manager.dart';
import 'package:dio/dio.dart';

class ApiRepository {
  List<AmiiboForList> listOfResult = <AmiiboForList>[];

  Future<List<AmiiboForList>> getList() async {
    final client = ApiManager(Dio());
    return await client.getAmiibo().then((response) {
      var list = response.amiibo;
      list.forEach((element) {
        listOfResult.add(new AmiiboForList(
            gameSeries: element.gameSeries,
            character: element.character,
            image: element.image));
      });
      return listOfResult;
    });
  }
}
