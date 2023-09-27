import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ContactResponse {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "link")
  String? link;
  
  ContactResponse({
    this.email,
    this.phone,
    this.link,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'phone': phone,
      'link': link,
    };
  }

  factory ContactResponse.fromMap(Map<String, dynamic> map) {
    return ContactResponse(
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      link: map['link'] != null ? map['link'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactResponse.fromJson(String source) => ContactResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
