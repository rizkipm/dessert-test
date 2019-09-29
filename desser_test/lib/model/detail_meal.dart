// To parse this JSON data, do
//
//     final detailMeals = detailMealsFromJson(jsonString);

import 'dart:convert';

DetailMeals detailMealsFromJson(String str) => DetailMeals.fromJson(json.decode(str));

String detailMealsToJson(DetailMeals data) => json.encode(data.toJson());

class DetailMeals {
  List<Map<String, String>> meals;

  DetailMeals({
    this.meals,
  });

  factory DetailMeals.fromJson(Map<String, dynamic> json) => DetailMeals(
    meals: List<Map<String, String>>.from(json["meals"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
  );

  Map<String, dynamic> toJson() => {
    "meals": List<dynamic>.from(meals.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
  };
}
