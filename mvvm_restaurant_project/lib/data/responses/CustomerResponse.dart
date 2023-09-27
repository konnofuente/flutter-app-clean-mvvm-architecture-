import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotification")
  String? numOfNotification;
  
  CustomerResponse({
    this.id,
    this.name,
    this.numOfNotification,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'numOfNotification': numOfNotification,
    };
  }

  factory CustomerResponse.fromMap(Map<String, dynamic> map) {
    return CustomerResponse(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      numOfNotification: map['numOfNotification'] != null ? map['numOfNotification'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerResponse.fromJson(String source) => CustomerResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}