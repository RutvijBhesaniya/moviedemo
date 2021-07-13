// To parse this JSON data, do
//
//     final recommendedMovies = recommendedMoviesFromJson(jsonString);

import 'dart:convert';

RecommendedMovies recommendedMoviesFromJson(String str) => RecommendedMovies.fromJson(json.decode(str));

String recommendedMoviesToJson(RecommendedMovies data) => json.encode(data.toJson());

class RecommendedMovies {
  RecommendedMovies({
    this.items,
    this.errorMessage,
  });

  List<Item>? items;
  String? errorMessage;

  factory RecommendedMovies.fromJson(Map<String, dynamic> json) => RecommendedMovies(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    errorMessage: json["errorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
    "errorMessage": errorMessage,
  };
}

class Item {
  Item({
    this.id,
    this.title,
    this.fullTitle,
    this.year,
    this.releaseState,
    this.image,
    this.runtimeMins,
    this.runtimeStr,
    this.plot,
    this.contentRating,
    this.imDbRating,
    this.imDbRatingCount,
    this.metacriticRating,
    this.genres,
    this.genreList,
    this.directors,
    this.directorList,
    this.stars,
    this.starList,
  });

  String? id;
  String? title;
  String? fullTitle;
  String? year;
  ReleaseState? releaseState;
  String? image;
  String? runtimeMins;
  String? runtimeStr;
  String? plot;
  String? contentRating;
  String? imDbRating;
  String? imDbRatingCount;
  String? metacriticRating;
  String? genres;
  List<GenreList>? genreList;
  String? directors;
  List<RList>? directorList;
  String? stars;
  List<RList>? starList;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    title: json["title"],
    fullTitle: json["fullTitle"],
    year: json["year"],
    releaseState: releaseStateValues.map![json["releaseState"]],
    image: json["image"],
    runtimeMins: json["runtimeMins"],
    runtimeStr: json["runtimeStr"],
    plot: json["plot"],
    contentRating: json["contentRating"],
    imDbRating: json["imDbRating"],
    imDbRatingCount: json["imDbRatingCount"],
    metacriticRating: json["metacriticRating"],
    genres: json["genres"],
    genreList: List<GenreList>.from(json["genreList"].map((x) => GenreList.fromJson(x))),
    directors: json["directors"],
    directorList: List<RList>.from(json["directorList"].map((x) => RList.fromJson(x))),
    stars: json["stars"],
    starList: List<RList>.from(json["starList"].map((x) => RList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "fullTitle": fullTitle,
    "year": year,
    "releaseState": releaseStateValues.reverse![releaseState],
    "image": image,
    "runtimeMins": runtimeMins,
    "runtimeStr": runtimeStr,
    "plot": plot,
    "contentRating": contentRating,
    "imDbRating": imDbRating,
    "imDbRatingCount": imDbRatingCount,
    "metacriticRating": metacriticRating,
    "genres": genres,
    "genreList": List<dynamic>.from(genreList!.map((x) => x.toJson())),
    "directors": directors,
    "directorList": List<dynamic>.from(directorList!.map((x) => x.toJson())),
    "stars": stars,
    "starList": List<dynamic>.from(starList!.map((x) => x.toJson())),
  };
}

class RList {
  RList({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory RList.fromJson(Map<String, dynamic> json) => RList(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class GenreList {
  GenreList({
    this.key,
    this.value,
  });

  String? key;
  String? value;

  factory GenreList.fromJson(Map<String, dynamic> json) => GenreList(
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
  };
}

enum ReleaseState { JULY_16, JULY_23, JULY_30 }

final releaseStateValues = EnumValues({
  "July 16": ReleaseState.JULY_16,
  "July 23": ReleaseState.JULY_23,
  "July 30": ReleaseState.JULY_30
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
