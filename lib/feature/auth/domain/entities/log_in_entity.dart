class LogInEntity {
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
