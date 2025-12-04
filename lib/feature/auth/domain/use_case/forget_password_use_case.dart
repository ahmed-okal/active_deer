import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/forget_password_model.dart';
import '../entities/forget_password_entity.dart';
import '../repo/forget_password_repo.dart';

class ForgetPasswordUseCase {
  final ForgetPasswordRepo forgetPasswordRepo;

  ForgetPasswordUseCase(this.forgetPasswordRepo);

  Future<Either<Failure, ForgetPasswordModel>> call({
    required ForgetPasswordEntity forgetPasswordEntity,
  }) async {
    forgetPasswordEntity.loading(true);
    final result = forgetPasswordRepo.forgetPassword(forgetPasswordEntity);
    result.then((value) {
      forgetPasswordEntity.loading(false);
    });
    return result;
  }
}
