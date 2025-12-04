import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/saved_card_model.dart';

abstract class GetCardRepo {
  Future<Either<Failure, SavedCardModel>> getCardByToken(String token);
}
