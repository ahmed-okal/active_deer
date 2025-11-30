import 'package:active_deer/core/utils/constants.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../domain/entities/sign_up_entity.dart';
import '../models/sign_up_model.dart';

abstract class SignUpRemoteDataSource {
  Future<SignUpModel> signUp(SignUpEntity signUpEntity);
}

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  final ApiService apiService;

  SignUpRemoteDataSourceImpl(this.apiService);

  @override
  Future<SignUpModel> signUp(SignUpEntity signUpEntity) async {
    try {
      final response = await apiService.postRaw(
        '${AppConstants.baseUrl}auth/users/signup',
        signUpEntity.toJson(),
        Options(contentType: Headers.formUrlEncodedContentType),
      );
      return SignUpModel.fromJson(response.data);
    } catch (e) {
      throw AppExceptions(message: e.toString());
    }
  }
}
