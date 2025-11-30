import 'package:active_deer/core/services/use_case.dart';

class LogInEntity extends Param {
  final String phoneNumber;
  final String password;
  final String tenantId;
  final String companyId;
  final String branchId;
  LogInEntity({
    required this.phoneNumber,
    required this.password,
    required this.tenantId,
    required this.companyId,
    required this.branchId,
    required super.loading,
  });
  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'password': password,
      'tenantId': tenantId,
      'companyId': companyId,
      'branchId': branchId,
    };
  }
}
