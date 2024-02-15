import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/data/repository/brand_repo/brand_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/model/brand_model/brand_model.dart';
import '../../../data/model/product_model/product_model.dart';

part 'brand_state.dart';

class BrandCubit extends Cubit<BrandState>
{
  BrandCubit(this.brandRepo) : super(BrandInitial());
  static BrandCubit get(context) =>
      BlocProvider.of(context);
  BrandRepo brandRepo;
  BrandModel ?brandModel;
  ScrollController scrollController = ScrollController();
  int page =1;
  void onScroll()
  {
    scrollController.addListener(() {
      if(scrollController.position.atEdge)
      {
        if(scrollController.position.pixels !=0)
        {
          if(page <= brandModel!.meta!.lastPage!)
          {
            page++;
            getBrand();
          }
        }
      }
    });

  }
  Future<void> getBrand()
  async{
    if(page ==1)
      {
        emit(BrandLoading());
      }
    brandRepo.getBrand(page).then((value) {
      value.fold((error) {
        emit(BrandError(error.toString()));
      }, (value)
      {
        if(page ==1)
          {
            brandModel = value;
          }else
            {
              brandModel!.data!.addAll(value.data!);
            }
        page++;
        emit(BrandSuccess(value));
      });
    }); }
  int pageProduct = 1;
  ScrollController scrollControllerProduct = ScrollController();
  void onScrollProduct(int id)
  {
    scrollControllerProduct.addListener(() {
      if(scrollControllerProduct.position.atEdge)
      {
        if(scrollControllerProduct.position.pixels !=0)
        {
          if(pageProduct <= getProductModel!.meta!.lastPage!)
          {
            pageProduct++;
            getProductBrand(id);
          }
        }
      }
    });

  }
  GetProductModel ? getProductModel;
  Future<void> getProductBrand(int id)
  async
  {
    if(pageProduct == 1)
      {
        emit(BrandProductLoading());

      }
    brandRepo.getBrandProduct(brandId: id).then((value) {
      value.fold((error) {
        emit(BrandProductError(error.toString()));
      }, (value)
      {
        if(pageProduct ==1)
          {
            getProductModel = value;
          }else{
          getProductModel!.data!.addAll(value.data!);
        }
        emit(BrandProductSuccess(value));
      });
    });
  }

}
