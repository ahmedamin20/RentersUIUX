import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/data/model/product_model/product_model.dart';
import 'package:ksb/data/repository/favoutite_repo/favoutite_repo.dart';
import 'package:ksb/data/repository/get_product_repo/gert_product_repo.dart';
import 'package:meta/meta.dart';
part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState>
{
  FavouriteCubit(
      this._favouriteRepo ,
      this._getProductRepo
      ) : super(FavouriteInitial());
  static FavouriteCubit get(context) => BlocProvider.of(context);
  FavouriteRepo _favouriteRepo ;
  GetProductRepo _getProductRepo ;
  GetProductModel  ? getProductFavouriteModel;
  int page = 1;
  ScrollController scrollController = ScrollController();
  void pageination()
  {
    scrollController.addListener(() {
      if(scrollController.position.atEdge)
      {
        if(scrollController.position.pixels != 0)
        {
          if(getProductFavouriteModel!.meta!.lastPage! >= page)
          {
            getFavouriteData();
          }
        }
      }
    });
  }
  Future<void> getFavouriteData() async
  {
    if(page ==1)
      {
        getProductFavouriteModel = null;
        emit(FavouriteLoading());
      }
    var result = await _getProductRepo.getProducts(page,favoritesOnly: true);
    result.fold((error) {
      emit(FavouriteError(error.message));
    }, (success)
    {
      if(page ==1)
        {
          getProductFavouriteModel = success;
        }else{
        getProductFavouriteModel!.data!.addAll(success.data!);
      }
      page++;
      emit(FavouriteSuccess());
    });
  }
  Future<void> toggleProductFavourite(int id , int index  , {String type = "product"}) async
  {
    emit(ToggleFavouriteLoadingState(index: index));
    var result = await _favouriteRepo.toggleFavourite(id ,type: type);
    result.fold((error) {
      emit(ToggleFavouriteErrorState(error.message , index));
    }, (success)
    {
      emit(ToggleFavouriteSuccessState(index: index));
    });
  }
}
