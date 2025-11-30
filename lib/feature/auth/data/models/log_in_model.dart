// To parse this JSON data, do
//
//     final logInModel = logInModelFromJson(jsonString);

import 'dart:convert';

LogInModel logInModelFromJson(String str) =>
    LogInModel.fromJson(json.decode(str));

String logInModelToJson(LogInModel data) => json.encode(data.toJson());

class LogInModel {
  final int? status;
  final String? message;
  final Data? data;

  LogInModel({this.status, this.message, this.data});

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
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
  final String? username;
  final String? email;
  final String? mobile;
  final String? password;
  final int? pinCodeLock;
  final bool? isEmployee;
  final String? role;
  final String? name;
  final List<dynamic>? myApps;
  final List<dynamic>? userSettings;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final String? idNumber;
  final DateTime? dateOfBirth;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Data({
    this.id,
    this.username,
    this.email,
    this.mobile,
    this.password,
    this.pinCodeLock,
    this.isEmployee,
    this.role,
    this.name,
    this.myApps,
    this.userSettings,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.idNumber,
    this.dateOfBirth,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    username: json["username"],
    email: json["email"],
    mobile: json["mobile"],
    password: json["password"],
    pinCodeLock: json["pinCodeLock"],
    isEmployee: json["isEmployee"],
    role: json["role"],
    name: json["name"],
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
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "username": username,
    "email": email,
    "mobile": mobile,
    "password": password,
    "pinCodeLock": pinCodeLock,
    "isEmployee": isEmployee,
    "role": role,
    "name": name,
    "my_apps": myApps == null ? [] : List<dynamic>.from(myApps!.map((x) => x)),
    "userSettings": userSettings == null
        ? []
        : List<dynamic>.from(userSettings!.map((x) => x)),
    "tenant_id": tenantId,
    "company_id": companyId,
    "branch_id": branchId,
    "id_number": idNumber,
    "dateOfBirth": dateOfBirth?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
