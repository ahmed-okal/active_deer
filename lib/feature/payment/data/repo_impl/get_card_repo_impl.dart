import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/get_card_repo.dart';
import '../models/saved_card_model.dart';
import '../remote_data_sources/get_card_remote_data_source.dart';

class GetCardRepoImpl implements GetCardRepo {
  final GetCardRemoteDataSource remoteDataSource;

  GetCardRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, SavedCardModel>> getCardByToken(String token) async {
    try {
      final result = await remoteDataSource.getCardByToken(token);
      return Right(result);
    } on AppExceptions catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: 'generalError'.tr));
    }
  }
}
