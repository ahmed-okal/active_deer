import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/sign_up_model.dart';
import '../entities/sign_up_entity.dart';

abstract class SignUpRepo {
  Future<Either<Failure, SignUpModel>> signUp(SignUpEntity signUpEntity);
}
