import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/saved_card_model.dart';

abstract class DeleteCardRepo {
  Future<Either<Failure, SavedCardModel>> deleteCard(String token);
}
