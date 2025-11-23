import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/use_case.dart';
import '../../data/models/saved_card_model.dart';
import '../repositories/get_card_repo.dart';

class GetCardUseCase extends UseCase<SavedCardModel, String> {
  final GetCardRepo repository;

  GetCardUseCase(this.repository);

  @override
  Future<Either<Failure, SavedCardModel>> call(String token) async {
    return await repository.getCardByToken(token);
  }
}
