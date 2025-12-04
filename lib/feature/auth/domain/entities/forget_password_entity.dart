import '../../../../core/services/use_case.dart';

class ForgetPasswordEntity extends Param {
  final String mobile;

  ForgetPasswordEntity({required this.mobile, required super.loading});
  Map<String, dynamic> toJson() {
    return {'mobile': mobile};
  }
}
