import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/data/repository/visitor_car_repo.dart';
import 'package:meta/meta.dart';
import '../../../data/model/visitor_car_models/visitor_car_model.dart';
part 'visitor_car_state.dart';

class VisitorCarCubit extends Cubit<VisitorCarState>
{
  VisitorCarCubit(this.visitorCarRepo) : super(VisitorCarInitial());
  static VisitorCarCubit get(context) => BlocProvider.of(context);
  VisitorCarRepo visitorCarRepo ;
  int page = 1;
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  VisitorCarNewModel? visitorCarModel;
  void pageination()
  {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          if (visitorCarModel!.meta!.lastPage! >= page) {
            getVisitorCar();
          }
        }
      }
    });
  }
  Future<void> getVisitorCar()
  {
    if(page==1)
      {
        emit(GetVisitorLoading());

      }
    Map<String, dynamic> queryData = {
      "page" : page,
      "per_page" : "25",
      "handle" :searchController.text,
    };
    return visitorCarRepo.getCarVisitor(queryData).
    then((value) {
      value.fold((l) {
        emit(GetVisitorError(l.toString()));
      }, (r)
      {
        if(page==1)
        {
          visitorCarModel = r;

        }else{
          visitorCarModel!.data!.addAll(r.data!);
        }
        page++;
        emit(GetVisitorSuccess(visitorCarModel!));
      });
    });
  }

}
