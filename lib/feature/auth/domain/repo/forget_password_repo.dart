import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/forget_password_model.dart';
import '../entities/forget_password_entity.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(
    ForgetPasswordEntity entity,
  );
}
