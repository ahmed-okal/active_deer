import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/forget_password_entity.dart';
import '../models/forget_password_model.dart';

abstract class ForgetPasswordRemoteDataSource {
  Future<ForgetPasswordModel> forgetPassword(ForgetPasswordEntity entity);
}

class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSource {
  final ApiService apiService;

  ForgetPasswordRemoteDataSourceImpl(this.apiService);
  @override
  Future<ForgetPasswordModel> forgetPassword(
    ForgetPasswordEntity entity,
  ) async {
    try {
      final response = await apiService.postRaw(
        '${AppConstants.baseUrl}auth/users/forgot-password',
        entity.toJson(),
        Options(contentType: Headers.formUrlEncodedContentType),
      );
      return ForgetPasswordModel.fromJson(response.data);
    } catch (e) {
      throw AppExceptions(message: e.toString());
    }
  }
}
