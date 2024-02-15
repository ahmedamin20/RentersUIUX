import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/brands_model/brands_model.dart';
import '../../../data/model/car_grage_model/car_grage_model.dart';
import '../../../data/repository/grage_car_repo/grage_car_repo.dart';

part 'car_s_grage_state.dart';

class CarSGrageCubit extends Cubit<CarSGrageState> {
  CarSGrageCubit(this.grageCarRepo) : super(CarSGrageInitial());
  static CarSGrageCubit get(context) => BlocProvider.of(context);
  GrageCarRepo grageCarRepo;
  CarGrageModel? carGrageModel;
  TextEditingController searchController = TextEditingController();
  int page = 1;
  ScrollController scrollController = ScrollController();
  void pageination() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          if (carGrageModel!.meta!.lastPage! >= page) {
            getCarSGrageData();
          }
        }
      }
    });
  }
  Future<void> getCarSGrageData
      ({
    String? handle,
    int? brandId,
    bool favorites_only = false,
      })
  async {
    emit(CarSGrageLoading());
      Map<String, dynamic> queryData = {
        "with_favorites" : "yes",
        "favorites_only" : favorites_only ? "yes":"no",
        "handle" : handle,
        "brand_id" : brandId,
"page" : page,
        "per_page" : "25"
      };
      final data = await grageCarRepo.getGrageCar(queryParameters: queryData);
data.fold((l) {
        emit(CarSGrageError(l.toString()));
      }, (r)
{
  if(page==1)
    {
      carGrageModel = r;

    }else{
    carGrageModel!.data!.addAll(r.data!);
  }
  page++;
        emit(CarSGrageSuccess());
      });

  }
  BrandsModel ? brandsModel;
  BrandsModel ? selectBrandsModel;
  int ? selectBrandId;
  BrandsModel ? searchModel;
  Future<void> getBrand() async {
    emit(GetBrandLoadingState());

    final data = await grageCarRepo.getBrands();
    data.fold((l) {
      emit(GetBrandErrorState(l.toString()));
    }, (r)
    {

          brandsModel = r;


      emit(GetBrandSuccessState());
    });

  }
}
