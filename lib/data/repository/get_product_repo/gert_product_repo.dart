import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ksb/core/services/error/failuar.dart';
import 'package:ksb/data/model/get_product_detiales_model/get_product_detiles_model.dart';
import 'package:ksb/data/model/product_model/product_model.dart';

import '../../../core/helpers/dio_helpers/dio_helpers.dart';
import '../../../core/helpers/dio_helpers/end_points.dart';

abstract class GetProductRepo
{
  Future<Either<Failure , GetProductModel>> getProducts
      (int page,{bool favoritesOnly , String ? search ,
    int? brandId,

  });
  Future<Either<Failure , GetProductDetilesModel>> getProductsDetiles
      ({bool favoritesOnly ,
    required  int productId
  });
  Future<Either<Failure , GetProductDetilesModel>> getProductsDetilesByBarCode
      ({bool favoritesOnly ,
    required  String barCode
  });
}

class  GetProductRepoImpl extends GetProductRepo {
  @override
  Future<Either<Failure, GetProductModel>>
  getProducts(page,{
    bool favoritesOnly = false,
    String ? search,
    int ?brandId,
})
 async
 {
    try
    {
      Response response =
          await DioHelper.
      getData(url: EndPoint.GET_PRODUCT_END_POINT,
          queryParameters:
          {
            "with_favorites" : "yes",
            "favorites_only" : favoritesOnly ? "yes":"no",
            "page" : page,
            "per_page" : "15",
            "handle" : search,
            "brand_id" : brandId,
          }
          );
      return right(GetProductModel.fromJson(response.data));
    }
    on DioException catch(e)
    {
      return left(ServerFailure.fromDioError(e));
    } catch(e)
    {
      return left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetProductDetilesModel>>
  getProductsDetiles
      ({bool favoritesOnly = false,
    required  int productId
  })  async
  {
    try
    {
      Response response =
      await DioHelper.
      getData(url: "${EndPoint.GET_PRODUCT_END_POINT}/$productId",
          queryParameters:
          {
            "with_favorites" : "yes",
            "favorites_only" : favoritesOnly ? "yes":"no",
          }
      );
      return right(GetProductDetilesModel.fromJson(response.data));
    }
    on DioException catch(e)
    {
      return left(ServerFailure.fromDioError(e));
    } catch(e)
    {
      return left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetProductDetilesModel>>
  getProductsDetilesByBarCode({bool favoritesOnly  = false, required String barCode})
  async
  {
    try
    {
      Response response =
          await DioHelper.
      getData(url: "${EndPoint.GET_PRODUCT_BY_BARCODE}$barCode",
          queryParameters:
          {
            "with_favorites" : "yes",
            "favorites_only" : favoritesOnly ? "yes":"no",
          }
      );
      return right(GetProductDetilesModel.fromJson(response.data));
    }
    on DioException catch(e)
    {
      return left(ServerFailure.fromDioError(e));
    } catch(e)
    {
      return left(FailureLocal(message: e.toString()));
    }
  }
}