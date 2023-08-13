import '../error/response.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<A, T> {
  Future<Either<ResponseI, A>> call(T params);
}
