import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/constants.dart';
import '../models/saved_card_model.dart';

abstract class GetCardRemoteDataSource {
  Future<SavedCardModel> getCardByToken(String token);
}

class GetCardRemoteDataSourceImpl implements GetCardRemoteDataSource {
  final ApiService apiService;
  GetCardRemoteDataSourceImpl(this.apiService);
  @override
  Future<SavedCardModel> getCardByToken(String token) async {
    final result = await apiService.getRequest(
      '${Constants.paymentBaseUrl}tokens/$token',
    );
    final responseData = result.data;
    if (result.statusCode == 200) {
      return SavedCardModel.fromMoyasarResponse(responseData ?? {});
    }
    throw AppExceptions(
      message: responseData['message'] ?? 'Authentication failed',
      statusCode: result.statusCode,
      data: responseData,
    );
  }
}
