import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/data/model/get_product_detiales_model/get_product_detiles_model.dart';
import 'package:ksb/data/model/product_model/product_model.dart';
import 'package:meta/meta.dart';

import '../../../core/services/error/failuar.dart';
import '../../../data/repository/get_product_repo/gert_product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState>
{
  ProductCubit(this._productRepo) : super(ProductInitial());
  static  ProductCubit get(context) => BlocProvider.of(context);
  GetProductRepo _productRepo;
  GetProductModel ?getProductModel;
  GetProductDetilesModel ?getProductDetilesModel;
  int page = 1;
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  void pageination()
  {
    scrollController.addListener(() {
      if(scrollController.position.atEdge)
        {
          if(scrollController.position.pixels != 0)
            {
              if(getProductModel!.meta!.lastPage! >= page)
                {
                  getProduct();
                }
            }
        }
    });
  }
  Future<void> getProduct({
    String ?  search
})
  async
  {
    if(page ==1)
      {
        emit(GetProductLoading());
      }
    var result = await _productRepo.getProducts(page , search: search);
    result.fold((error) {
      emit(GetProductError(error));
    }, (success)
    {
      if(page ==1)
        {
          getProductModel = success;
        }else {
        getProductModel!.data!.addAll(success.data!);
      }
      page++;

      emit(GetProductSuccess());
    });

  }
  Future<void>
  getProductDetiles(int productId)
  async
  {
    emit(ProductDetilesLoading());
    var result =await _productRepo.getProductsDetiles(productId: productId);
    result.fold((error) {
      emit(ProductDetilesError(error));
    }, (success)
    {
      getProductDetilesModel = success;
      emit(ProductDetilesSuccess(getProductDetilesModel!));
    });
  }
  Future<void>
  getProductDetialsByBarCode(String barCode)
  async
  {
    emit(ProductDetilesLoading());
    var result =await _productRepo.getProductsDetilesByBarCode(barCode: barCode);
    result.fold((error) {
      emit(ProductDetilesError(error));
    }, (success)
    {
      getProductDetilesModel = success;
      emit(ProductDetilesSuccess(getProductDetilesModel!));
    });
  }

}
