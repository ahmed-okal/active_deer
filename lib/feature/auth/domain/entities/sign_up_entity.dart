import 'package:active_deer/core/services/use_case.dart';

class SignUpEntity extends Param {
  final String tenantId;
  final String companyId;
  final String branchId;
  final String username;
  final String name;
  final String email;
  final String mobile;
  final String password;
  final String idNumber;
  final String dateOfBirth;
  final String role;

  SignUpEntity({
    required this.tenantId,
    required this.companyId,
    required this.branchId,
    required super.loading,
    required this.username,
    required this.name,
    required this.email,
    required this.mobile,
    required this.password,
    required this.idNumber,
    required this.dateOfBirth,
    required this.role,
  });
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'name': name,
      'email': email,
      'mobile': mobile,
      'password': password,
      'id_number': idNumber,
      'dateOfBirth': "1998-01-01",
      "role": "active_deer",
      'tenantId': tenantId,
      'companyId': companyId,
      'branchId': branchId,
    };
  }
}
