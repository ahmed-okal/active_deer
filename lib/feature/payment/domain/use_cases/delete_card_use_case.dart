import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/use_case.dart';
import '../../data/models/saved_card_model.dart';
import '../repositories/delete_card_repo.dart';

class DeleteCardUseCase extends UseCase<SavedCardModel, String> {
  final DeleteCardRepo repository;

  DeleteCardUseCase(this.repository);

  @override
  Future<Either<Failure, SavedCardModel>> call(String token) async {
    return await repository.deleteCard(token);
  }
}
