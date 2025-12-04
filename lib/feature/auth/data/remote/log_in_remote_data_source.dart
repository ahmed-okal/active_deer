import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/log_in_entity.dart';
import '../models/log_in_model.dart';

abstract class LogInRemoteDataSource {
  Future<LogInModel> logIn({required LogInEntity logInEntity});
}

class LogInRemoteDataSourceImpl implements LogInRemoteDataSource {
  final ApiService apiService;

  LogInRemoteDataSourceImpl(this.apiService);

  @override
  Future<LogInModel> logIn({required LogInEntity logInEntity}) async {
    try {
      final response = await apiService.postRaw(
        '${AppConstants.baseUrl}auth/users/login',
        logInEntity.toJson(),
        Options(contentType: Headers.formUrlEncodedContentType),
      );
      return LogInModel.fromJson(response.data);
    } catch (e) {
      throw AppExceptions(message: e.toString());
    }
  }
}
