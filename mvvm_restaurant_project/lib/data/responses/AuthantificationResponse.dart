// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'BaseResponse.dart';
import 'ContactResponse.dart';
import 'CustomerResponse.dart';

@JsonSerializable()
class AuthantificationResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contacts")
  ContactResponse? contact ;
  AuthantificationResponse({
    this.customer,
    required this.contact,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customer': customer?.toMap(),
      'contact': contact?.toMap(),
    };
  }

  factory AuthantificationResponse.fromMap(Map<String, dynamic> map) {
    return AuthantificationResponse(
      customer: map['customer'] != null ? CustomerResponse.fromMap(map['customer'] as Map<String,dynamic>) : null,
      contact:map['contact'] != null ? ContactResponse.fromMap(map['contact'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthantificationResponse.fromJson(String source) => AuthantificationResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
