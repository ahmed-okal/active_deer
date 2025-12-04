import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/use_case.dart';
import '../../data/models/saved_card_model.dart';
import '../entities/card_token_request.dart';
import '../repositories/save_card_repo.dart';

class SaveCardUseCase extends UseCase<SavedCardModel, CardTokenRequest> {
  final SaveCardRepo repository;

  SaveCardUseCase(this.repository);

  @override
  Future<Either<Failure, SavedCardModel>> call(CardTokenRequest request) async {
    return await repository.saveCard(request);
  }
}
