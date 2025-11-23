import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/card_token_request.dart';
import '../models/saved_card_model.dart';

abstract class SaveCardRemoteDataSource {
  Future<SavedCardModel> saveCard(CardTokenRequest request);
}

class SaveCardRemoteDataSourceImpl implements SaveCardRemoteDataSource {
  final ApiService apiService;
  SaveCardRemoteDataSourceImpl(this.apiService);

  @override
  Future<SavedCardModel> saveCard(CardTokenRequest request) async {
    final pk = Constants.paymentSecretTestApiKey;
    final basic = base64Encode(utf8.encode('$pk:'));

    final result = await apiService.post(
      '${Constants.paymentBaseUrl}tokens',
      request.toMap(),
      Options(
        headers: {'Authorization': 'Basic $basic'},
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    final responseData = result.data;
    if (result.statusCode == 200) {
      return SavedCardModel.fromMoyasarResponse(responseData);
    }

    throw AppExceptions(
      message: responseData['message'] ?? 'Authentication failed',
      statusCode: result.statusCode,
      data: responseData,
    );
  }
}
