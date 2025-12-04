import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/sign_up_entity.dart';
import '../../domain/repo/sign_up_repo.dart';
import '../models/sign_up_model.dart';
import '../remote/sign_up_remote_data_source.dart';

class SignUpRepoImpl implements SignUpRepo {
  final SignUpRemoteDataSource remoteDataSource;

  SignUpRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, SignUpModel>> signUp(SignUpEntity signUpEntity) async {
    try {
      final response = await remoteDataSource.signUp(signUpEntity);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
