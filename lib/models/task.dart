// To parse this JSON data, do
//
//     final task = taskFromMap(jsonString);

import 'dart:convert';

class Task {
  Task(
      {required this.available,
      required this.name,
      this.picture,
      required this.price,
      this.id});

  bool available;
  String name;
  String? picture;
  double price;
  String? id;

  factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
      };

  Task copy() => Task(
      available: this.available,
      name: this.name,
      picture: this.picture,
      price: this.price,
      id: this.id);
}
