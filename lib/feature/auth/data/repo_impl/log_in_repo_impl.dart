import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/log_in_entity.dart';
import '../../domain/repo/log_in_repo.dart';
import '../models/log_in_model.dart';
import '../remote/log_in_remote_data_source.dart';

class LogInRepoImpl implements LogInRepo {
  final LogInRemoteDataSource logInRemoteDataSource;

  LogInRepoImpl(this.logInRemoteDataSource);

  @override
  Future<Either<Failure, LogInModel>> logIn({
    required LogInEntity logInEntity,
  }) async {
    try {
      final response = await logInRemoteDataSource.logIn(
        logInEntity: logInEntity,
      );
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
