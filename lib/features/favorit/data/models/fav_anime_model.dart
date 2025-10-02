class FavAnimeModel {
  final int malId;
  final String titleEnglish;
  final int rate;
  final String status;
  final String imageUrl;

  FavAnimeModel({
    required this.malId,
    required this.titleEnglish,
    required this.rate,
    required this.status,
    required this.imageUrl,
  });

  factory FavAnimeModel.fromJson(Map<String, dynamic> json) {
    return FavAnimeModel(
      malId: json["malId"],
      titleEnglish: json["titleEnglish"],
      rate: json["rate"],
      status: json["status"],
      imageUrl: json["imageUrl"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "malId": malId,
      "titleEnglish": titleEnglish,
      "rate": rate,
      "status": status,
      "imageUrl": imageUrl,
    };
  }
}
