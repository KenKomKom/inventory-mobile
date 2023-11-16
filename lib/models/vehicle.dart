import 'dart:convert';

List<Vehicle> vehicleFromJson(String str) => List<Vehicle>.from(json.decode(str).map((x) => Vehicle.fromJson(x)));

String vehicleToJson(List<Vehicle> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vehicle {
    String model;
    int pk;
    Fields fields;

    Vehicle({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int amount;
    String description;
    String imageLink;

    Fields({
        required this.user,
        required this.name,
        required this.amount,
        required this.description,
        required this.imageLink,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
        imageLink: json["image_link"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "description": description,
        "image_link": imageLink,
    };
}
