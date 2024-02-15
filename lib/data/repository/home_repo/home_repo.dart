
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ksb/core/helpers/dio_helpers/dio_helpers.dart';
import 'package:ksb/core/services/error/failuar.dart';
import 'package:ksb/data/model/show_all_branch_product/show_all_branch_product.dart';

import '../../../core/caching_data/cacshing_date.dart';
import '../../../core/helpers/dio_helpers/end_points.dart';
import '../../model/branch/branch_model.dart';
import '../../model/post_model/post_model.dart';
import '../../model/show_all_branch/show_all_branch_model.dart';
import '../../model/show_one_product_model/show_one_product_model.dart';

abstract class HomeRepo {


  Future<Either<Failure, ShowAllBranchModel>> showAllBranch(
      {required int page, storeId});

  Future<Either<Failure, ShowAllMenuSectionsModel>> showAllMenuSections(
      {required String idStor});

  Future<Either<Failure, ShowAllBranchProducts>> showAllBranchProduct(
      {required String id,required int page,menuSelectionId});

  Future<Either<Failure, ShowOneProductModel>> showOneBranchProduct(
      {required String branchId, required String productId});


  Future<Either<Failure,PostModel>> sentToCart({
    required String branch_product_id,
    required int quantity,
    required List<dynamic> addons,
    required String size,
    required String DO_NOT_SEND,
  });
}




class HomeRepoImpl extends HomeRepo
{
  @override
  Future<Either<Failure, ShowAllBranchModel>> showAllBranch({required int page, storeId})async {

    try {
      Response response = await DioHelper.getData(
          url: '${EndPoint.showAllBranch}$page',
        queryParameters: {
         'store-id':storeId
        }
      );

      return right(ShowAllBranchModel.fromJson(response.data));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(FailureLocal(message: e.toString()));
    }


  }

  @override
  Future<Either<Failure, ShowAllMenuSectionsModel>> showAllMenuSections({required String idStor})async {
    try {
      Response response = await DioHelper.getData(
          url: '/stores/${idStor}/menu_sections');
      return right(ShowAllMenuSectionsModel.fromJson(response.data));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShowAllBranchProducts>> showAllBranchProduct({required String id,required int page,menuSelectionId})async {
    try {
      Response response = await DioHelper.getData(
          url: '/branches/$id/products?page=$page',
        queryParameters: {
            'menu_section_id':menuSelectionId,
        }

      );
      return right(ShowAllBranchProducts.fromJson(response.data));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShowOneProductModel>> showOneBranchProduct({required String branchId,required productId})async {
    try {
      Response response = await DioHelper.getData(
          url: '/branches/$branchId/products/$productId');
      return right(ShowOneProductModel.fromJson(response.data));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(FailureLocal(message: e.toString()));
    }
  }


  @override
  Future<Either<Failure, PostModel>> sentToCart({
    required String branch_product_id,
    required int quantity,
    required List<dynamic> addons,
    required String size,
    required String DO_NOT_SEND,
  }) async{
    try {
      Response ressposne = await DioHelper.postData(
          url: EndPoint.getAllCartItem,
          token: CachingData.instance.getCachedLogin()!.data!.token,
          data: {
            "branch_product_id": branch_product_id,
            "quantity": quantity,
            "addons":addons ,
            "size": size,
            "DO_NOT_SEND": DO_NOT_SEND,
          }
      );
      return Right(PostModel.fromJson(ressposne.data));

    } on DioException catch(e)
    {
      return Left(ServerFailure.fromDioError(e));
    }catch (e) {
      return Left(FailureLocal(message: e.toString()));

    }

  }

}