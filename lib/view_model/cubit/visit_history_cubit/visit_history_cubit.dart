import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/data/model/get_visit_history_details_model/get_visit_history_details_model.dart';
import 'package:ksb/data/repository/visite_history_repo/visit_history_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/model/visit_history_model/visit_history_model.dart';

part 'visit_history_state.dart';

class VisitHistoryCubit extends Cubit<VisitHistoryState>
{
  VisitHistoryCubit(this.visitHistoryRepo) :
        super(VisitHistoryInitial());
  static VisitHistoryCubit get(context) =>
      BlocProvider.of(context);
  VisitHistoryRepo visitHistoryRepo ;
  VisitHistoryModel  ? visitHistoryModel;
  GetVisitHistoryDetailsModel ? getVisitHistoryDetailsModel;
  ScrollController scrollController = ScrollController();
  int page = 1;
  void pageination()
  {
    scrollController.addListener(() {
      if(scrollController.position.atEdge)
        {
          if(scrollController.position.pixels != 0)
            {
              if(visitHistoryModel!.meta!.lastPage! >= page)
                {
                  getUserVisitHistory();
                }
            }
        }
    });
  }
  Future<void> getUserVisitHistory() async
  {
    if(page ==1)
      {
        visitHistoryModel = null;
        emit(VisitHistoryLoading());
      }

    final response = await visitHistoryRepo.getVisitHistory(page);
    response.fold((error) {
      emit(VisitHistoryError(error.message));
    }, (data)
    {
      if(page==1)
        {
          visitHistoryModel = data;
        }else
        {
          visitHistoryModel!.data!.addAll(data.data!);
        }
      page++;
      print("////////////////////");
      // print(visitHistoryModel!.data![0].id);
      // print(visitHistoryModel!.data![0].garage!.name);
      print("////////////////////");

      emit(VisitHistorySuccess());
    });
  }
  Future<void> getUserHistoryDetails(String id) async
  {
    getVisitHistoryDetailsModel = null;
    emit(VisitHistoryDetailsLoading());
    final response = await visitHistoryRepo.getVisitHistoryDetails(id);
    response.fold((error) {
      emit(VisitHistoryDetailsError(error.message));
    }, (data)
    {
      getVisitHistoryDetailsModel = data;

      emit(VisitHistoryDetailsSuccess(data));
    });
  }
}
