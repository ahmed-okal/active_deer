import 'package:active_deer/core/utils/constants.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../models/saved_card_model.dart';

abstract class DeleteCardRemoteDataSource {
  Future<SavedCardModel> deleteCard(String token);
}

class DeleteCardRemoteDataSourceImpl implements DeleteCardRemoteDataSource {
  final ApiService apiService;
  DeleteCardRemoteDataSourceImpl(this.apiService);
  @override
  Future<SavedCardModel> deleteCard(String token) async {
    final result = await apiService.deleteRequest(
      '${Constants.paymentBaseUrl}tokens/$token',
    );
    final responseData = result.data;
    if (result.statusCode == 200 || result.statusCode == 204) {
      return SavedCardModel.fromMoyasarResponse(responseData ?? {});
    }

    throw AppExceptions(
      message: responseData['message'] ?? 'Authentication failed',
      statusCode: result.statusCode,
      data: responseData,
    );
  }
}
