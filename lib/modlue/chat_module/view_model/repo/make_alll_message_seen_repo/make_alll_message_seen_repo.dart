import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/helpers/dio_helpers/dio_helpers.dart';
import '../../../core/failure/Failure.dart';

abstract class MakeAllMessageSeenRepo {
  Future<Either<Failure, String>> makeAllMessageSeen({required String userID});
}

class MakeAllMessageSeenRepoImpl extends MakeAllMessageSeenRepo {
  @override
  Future<Either<Failure, String>> makeAllMessageSeen(
      {required String userID}) async {
    try {
      Response response = await DioHelper.patchData(
        url: "/chat/messages",
        data: {"other_user_id": userID},
      );
      return Right(response.data.toString());
    } on DioException catch (e) {
      print("///////////////error//////////////");
      print(e.response!.data.toString());
      print("///////////////error//////////////");
      return Left(ServerFailure(message: e.response!.data.toString()));
    } catch (e) {
      print("///////////////error//////////////");
      print(e.toString());
      print("///////////////error//////////////");
      return Left(FailureLocal(message: e.toString()));
    }
  }
}
