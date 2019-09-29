// To parse this JSON data, do
//
//     final modelMeals = modelMealsFromJson(jsonString);

import 'dart:convert';

ModelMeals modelMealsFromJson(String str) => ModelMeals.fromJson(json.decode(str));

String modelMealsToJson(ModelMeals data) => json.encode(data.toJson());

class ModelMeals {
  List<Meal> meals;

  ModelMeals({
    this.meals,
  });

  factory ModelMeals.fromJson(Map<String, dynamic> json) => ModelMeals(
    meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
  };
}

class Meal {
  String strMeal;
  String strMealThumb;
  String idMeal;

  Meal({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    strMeal: json["strMeal"],
    strMealThumb: json["strMealThumb"],
    idMeal: json["idMeal"],
  );

  Map<String, dynamic> toJson() => {
    "strMeal": strMeal,
    "strMealThumb": strMealThumb,
    "idMeal": idMeal,
  };
}
