import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/log_in_model.dart';
import '../entities/log_in_entity.dart';

abstract class LogInRepo {
  Future<Either<Failure, LogInModel>> logIn({required LogInEntity logInEntity});
}
