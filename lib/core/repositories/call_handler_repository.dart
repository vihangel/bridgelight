import 'package:dartz/dartz.dart';
import 'package:mybookstore/core/utils/failures.dart';

class RepositoryCallHandler {
  ///TODO: network_info_plus: ^3.0.5
  // final NetworkInfo networkInfo;

  // CallHandler({required this.networkInfo});
  RepositoryCallHandler();

  Future<Either<Failure, T>> handleCall<T>(
    Future<T> Function() methodCall, {
    bool ignoreNetworkCheck = false,
  }) async {
    // if (await networkInfo.isConnected || ignoreNetworkCheck) {
    try {
      final result = await methodCall();

      return Right(result);
    } on GeneralFailure catch (e) {
      return Left(GeneralFailure(e.message));
    } catch (e) {
      return Left(GeneralFailure(e.toString()));
    }
    // } else {
    //   return Left(NetworkFailure(message: 'No internet connection.'));
    // }
  }
}
