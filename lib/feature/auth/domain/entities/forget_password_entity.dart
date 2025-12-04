import '../../../../core/services/use_case.dart';

class ForgetPasswordEntity extends Param {
  final String phoneNumber;

  ForgetPasswordEntity({required this.phoneNumber, required super.loading});
  Map<String, dynamic> toJson() {
    return {'phoneNumber': phoneNumber};
  }
}
