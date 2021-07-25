import 'dart:convert';

AmiiboResult amiiboResultFromJson(String str) => AmiiboResult.fromJson(json.decode(str));

String amiiboResultToJson(AmiiboResult data) => json.encode(data.toJson());

class AmiiboResult {
  AmiiboResult({
    this.amiibo,
  });

  List<Amiibo> amiibo;

  factory AmiiboResult.fromJson(Map<String, dynamic> json) => AmiiboResult(
    amiibo: List<Amiibo>.from(json["amiibo"].map((x) => Amiibo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "amiibo": List<dynamic>.from(amiibo.map((x) => x.toJson())),
  };
}

class Amiibo {
  Amiibo({
    this.amiiboSeries,
    this.character,
    this.gameSeries,
    this.head,
    this.image,
    this.name,
    this.tail,
    this.type,
  });

  String amiiboSeries;
  String character;
  String gameSeries;
  String head;
  String image;
  String name;
  String tail;
  String type;

  factory Amiibo.fromJson(Map<String, dynamic> json) => Amiibo(
    amiiboSeries: json["amiiboSeries"],
    character: json["character"],
    gameSeries: json["gameSeries"],
    head: json["head"],
    image: json["image"],
    name: json["name"],
    tail: json["tail"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "amiiboSeries": amiiboSeries,
    "character": character,
    "gameSeries": gameSeries,
    "head": head,
    "image": image,
    "name": name,
    "tail": tail,
    "type": type,
  };
}

