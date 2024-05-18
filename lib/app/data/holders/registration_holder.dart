// To parse this JSON data, do
//
//     final registrationHolder = registrationHolderFromJson(jsonString);

import 'dart:convert';

RegistrationHolder registrationHolderFromJson(String str) => RegistrationHolder.fromJson(json.decode(str));

String registrationHolderToJson(RegistrationHolder data) => json.encode(data.toJson());

class RegistrationHolder {
    final String? phone;
    final String? email;
    final String? name;
    final String? businessName;
    final String? businessTypeId;

    RegistrationHolder({
        this.phone,
        this.email,
        this.name,
        this.businessName,
        this.businessTypeId,
    });

    factory RegistrationHolder.fromJson(Map<String, dynamic> json) => RegistrationHolder(
        phone: json["phone"],
        email: json["email"],
        name: json["name"],
        businessName: json["business_name"],
        businessTypeId: json["business_type_id"],
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
        "email": email,
        "name": name,
        "business_name": businessName,
        "business_type_id": businessTypeId,
    };
}
