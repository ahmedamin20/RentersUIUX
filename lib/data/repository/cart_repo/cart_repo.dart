import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ksb/core/caching_data/cacshing_date.dart';
import 'package:ksb/core/helpers/dio_helpers/end_points.dart';
import 'package:ksb/core/services/error/failuar.dart';
import 'package:ksb/data/model/cart_model/cart_model.dart';

import '../../../core/helpers/dio_helpers/dio_helpers.dart';
import '../../model/post_model/post_model.dart';

abstract class CartRepo {
  Future<Either<Failure,CartModel>> getAllCartItem();


}



class CartRepoImpl implements CartRepo{
  @override
  Future<Either<Failure, CartModel>> getAllCartItem()async   {

   try {
     Response ressposne = await DioHelper.getData(
       url: EndPoint.getAllCartItem,
     );
     return Right(CartModel.fromJson(ressposne.data));

   } on DioException catch(e)
   {
     return Left(ServerFailure.fromDioError(e));
   }catch (e) {
     return Left(FailureLocal(message: e.toString()));

 }
  }





}