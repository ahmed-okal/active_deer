// To parse this JSON data, do
//
//     final forgetPasswordModel = forgetPasswordModelFromJson(jsonString);

import 'dart:convert';

ForgetPasswordModel forgetPasswordModelFromJson(String str) =>
    ForgetPasswordModel.fromJson(json.decode(str));

String forgetPasswordModelToJson(ForgetPasswordModel data) =>
    json.encode(data.toJson());

class ForgetPasswordModel {
  final int? status;
  final String? message;
  final String? sentTo;

  ForgetPasswordModel({this.status, this.message, this.sentTo});

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordModel(
        status: json["status"],
        message: json["message"],
        sentTo: json["sentTo"],
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "sentTo": sentTo,
  };
}
