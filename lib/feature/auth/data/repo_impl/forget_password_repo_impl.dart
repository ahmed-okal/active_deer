import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/forget_password_entity.dart';
import '../../domain/repo/forget_password_repo.dart';
import '../models/forget_password_model.dart';
import '../remote/forget_password_remote_data_source.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final ForgetPasswordRemoteDataSource remoteDataSource;

  ForgetPasswordRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(
    ForgetPasswordEntity entity,
  ) async {
    try {
      final result = await remoteDataSource.forgetPassword(entity);
      return Right(result);
    } on AppExceptions catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
