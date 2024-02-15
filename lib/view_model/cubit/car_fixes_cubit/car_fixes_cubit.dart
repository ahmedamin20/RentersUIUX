import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/data/model/car_fixes_model/get_car_fixes_model.dart';
import 'package:meta/meta.dart';
import 'package:open_file/open_file.dart';

import '../../../data/model/car_fix_detials_model/car_fix_details_model.dart';
import '../../../data/repository/car_fixes_repo/car_fixes_repo.dart';

part 'car_fixes_state.dart';

class CarFixesCubit extends Cubit<CarFixesState>
{
  CarFixesCubit(this.carFixesReo) : super(CarFixesInitial());
  static CarFixesCubit get(context) => BlocProvider.of(context);
  CarFixesReo carFixesReo ;
  GetCarFixesModel ? carFixesModel;
  CarFixDetailsModel ? carFixDetailsModel;
  ScrollController scrollController = ScrollController();
  int page = 1;
  bool isCheck = false;
  TextEditingController reviewController = TextEditingController();
  void pagination()
  {
    scrollController.addListener(() {
      if(scrollController.position.atEdge)
        {
          if(scrollController.position.pixels != 0)
            {
              if(carFixesModel!.meta!.lastPage! >= page)
                {
                  getCarFix();
                }

            }
        }
    });
  }
  TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  Future<void> getCarFix({
    String ?  search
})
 async
 {
   if(page ==1)
     {
       carFixesModel = null;
       emit(GetCarFixesLoadingState());
     }

    final response = await carFixesReo.
    getCarFixes(
        page ,
        search: search);
    response.fold((error) {
      emit(GetCarFixErrorState(error.toString()));
    }, (data) {
      if(page ==1)
        {
          carFixesModel = data;
        }else{
        carFixesModel!.data!.addAll(data.data!);
      }
      page++;
      emit(GetCarFixesSuccessState());
    });
 }
  Future<void> getCarFixDetails(int id)
  async
  {
    carFixDetailsModel = null;
    emit(GetCarFixesDetailsLoadingState());
    final response = await carFixesReo.getCarFixesDetails(id);
    response.fold((error) {
      emit(GetCarFixesDetailsErrorState(error.toString()));
    }, (data) {
      carFixDetailsModel = data;
      emit(GetCarFixesDetailsSuccessState());
    });
  }
  int ? status ;
  Future<void> getApproveOrRejectCarFixes(int id , int status)
  async
  {
    this.status = status;
    emit(SendApproveLoadingState());
    final response =  await carFixesReo.approveOrRejectCarFixes(id, status);
    response.fold((error) {
      emit(SendApproveErrorState(error.toString()));
    }, (data) {
      emit(SendApproveSuccessState(data));
    });
  }

  Future<void> downloadPDF(int pdfID)
  async
  {
    emit(DownloadPdfLoadingState());
    final response =  await carFixesReo.downloadPdfCarFix(pdfID);
    response.fold((error) {
      emit(DownloadPdfErrorState(error.toString()));
    }, (data)
    {
      print(data);
      OpenFile.open(data);
      emit(DownloadPdfSuccessState(data));
    });
  }
  Future<void> sendReview(int id)
  async
  {
    emit(SendReviewLoadingState());
    final response =  await carFixesReo.sendReview(
        id,
        reviewController.text);
    response.fold((error) {
      emit(SendReviewErrorState(error.toString()));
    }, (data) {
      emit(SendReviewSuccessState());
    });

  }

}
