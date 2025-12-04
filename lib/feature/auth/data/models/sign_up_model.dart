// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  final int? status;
  final String? message;
  final Data? data;

  SignUpModel({this.status, this.message, this.data});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final String? id;
  final String? email;
  final String? username;
  final String? mobile;
  final String? name;
  final int? pinCodeLock;
  final bool? isEmployee;
  final String? role;
  final List<dynamic>? myApps;
  final List<dynamic>? userSettings;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final String? idNumber;
  final DateTime? dateOfBirth;

  Data({
    this.id,
    this.email,
    this.username,
    this.mobile,
    this.name,
    this.pinCodeLock,
    this.isEmployee,
    this.role,
    this.myApps,
    this.userSettings,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.idNumber,
    this.dateOfBirth,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    email: json["email"],
    username: json["username"],
    mobile: json["mobile"],
    name: json["name"],
    pinCodeLock: json["pinCodeLock"],
    isEmployee: json["isEmployee"],
    role: json["role"],
    myApps: json["my_apps"] == null
        ? []
        : List<dynamic>.from(json["my_apps"]!.map((x) => x)),
    userSettings: json["userSettings"] == null
        ? []
        : List<dynamic>.from(json["userSettings"]!.map((x) => x)),
    tenantId: json["tenant_id"],
    companyId: json["company_id"],
    branchId: json["branch_id"],
    idNumber: json["id_number"],
    dateOfBirth: json["dateOfBirth"] == null
        ? null
        : DateTime.parse(json["dateOfBirth"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "username": username,
    "mobile": mobile,
    "name": name,
    "pinCodeLock": pinCodeLock,
    "isEmployee": isEmployee,
    "role": role,
    "my_apps": myApps == null ? [] : List<dynamic>.from(myApps!.map((x) => x)),
    "userSettings": userSettings == null
        ? []
        : List<dynamic>.from(userSettings!.map((x) => x)),
    "tenant_id": tenantId,
    "company_id": companyId,
    "branch_id": branchId,
    "id_number": idNumber,
    "dateOfBirth": dateOfBirth?.toIso8601String(),
  };
}
