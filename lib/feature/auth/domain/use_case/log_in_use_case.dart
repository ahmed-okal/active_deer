import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/log_in_model.dart';
import '../entities/log_in_entity.dart';
import '../repo/log_in_repo.dart';

class LogInUseCase {
  final LogInRepo logInRepo;

  LogInUseCase(this.logInRepo);

  Future<Either<Failure, LogInModel>> call({
    required LogInEntity logInEntity,
  }) async {
    logInEntity.loading(true);
    final result = logInRepo.logIn(logInEntity: logInEntity);
    result.then((value) {
      logInEntity.loading(false);
    });
    return result;
  }
}
