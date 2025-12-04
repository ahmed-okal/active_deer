import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/sign_up_model.dart';
import '../entities/sign_up_entity.dart';
import '../repo/sign_up_repo.dart';

class SignUpUseCase {
  final SignUpRepo signUpRepo;

  SignUpUseCase(this.signUpRepo);

  Future<Either<Failure, SignUpModel>> call(SignUpEntity signUpEntity) async {
    signUpEntity.loading(true);
    final result = signUpRepo.signUp(signUpEntity);
    result.then((value) {
      signUpEntity.loading(false);
    });
    return result;
  }
}
