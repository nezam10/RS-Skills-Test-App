// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) => RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) => json.encode(data.toJson());

class RegistrationModel {
    final int? status;
    final String? msg;
    final String? description;
    final String? phone;
    final String? email;
    final int? identifierId;

    RegistrationModel({
        this.status,
        this.msg,
        this.description,
        this.phone,
        this.email,
        this.identifierId,
    });

    factory RegistrationModel.fromJson(Map<String, dynamic> json) => RegistrationModel(
        status: json["status"],
        msg: json["msg"],
        description: json["description"],
        phone: json["phone"],
        email: json["email"],
        identifierId: json["identifier_id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "description": description,
        "phone": phone,
        "email": email,
        "identifier_id": identifierId,
    };
}
