import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/saved_card_model.dart';
import '../entities/card_token_request.dart';

abstract class SaveCardRepo {
  Future<Either<Failure, SavedCardModel>> saveCard(CardTokenRequest request);
}
