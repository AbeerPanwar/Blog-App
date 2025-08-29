import 'package:blog_app/core/error/faliure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Faliure,SuccessType>> call(Params params);
}

class NoParms {}