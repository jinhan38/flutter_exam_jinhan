import 'dart:convert';

List<CarouselModel> carouselModelFromJson(String str) =>
    List<CarouselModel>.from(
        json.decode(str).map((x) => CarouselModel.fromJson(x)));

String carouselModelToJson(List<CarouselModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarouselModel {
  CarouselModel({
    this.id,
    this.image,
  });

  String? id;
  String? image;

  factory CarouselModel.fromJson(Map<String, dynamic> json) => CarouselModel(
      id: json["_id"] == null ? null : json["_id"],
      image: json["image"]["url"] == null ? null : json["image"]["url"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
      };
}
