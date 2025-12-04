import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/card_token_request.dart';
import '../../domain/repositories/save_card_repo.dart';
import '../models/saved_card_model.dart';
import '../remote_data_sources/save_card_remote_data_source.dart';

class SaveCardRepoImpl implements SaveCardRepo {
  final SaveCardRemoteDataSource remoteDataSource;

  SaveCardRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, SavedCardModel>> saveCard(
    CardTokenRequest request,
  ) async {
    try {
      final result = await remoteDataSource.saveCard(request);
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
