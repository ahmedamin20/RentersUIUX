import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/data/model/get_info_data_model/get_info_data_model.dart';
import 'package:ksb/data/repository/Information_repo/information_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/model/terms_and_condatioon_model/terms_and_condation_model.dart';

part 'information_state.dart';

class InformationCubit extends Cubit<InformationState>
{
  InformationCubit(this.informationRepo) : super(InformationInitial());
  static InformationCubit get(context) => BlocProvider.of(context);
  InformationRepo informationRepo ;
  TermsAndCondationModel  ? termsAndCondationModel;
  Future<void> getTermsAndCondation()
  async
  {
    emit(GetTermsAndCondationLoading());
    var response = await informationRepo.getTermsAndCondation();
    response.fold((error) {
      emit(GetTermsAndCondationError(error.message));
    }, (data)
    {
      termsAndCondationModel = data;
      emit(GetTermsAndCondationSuccess(data));
    });
  }
  GetInfoDataModel ? getInfoDataModel;
  Future<void> getInfo()
  async
  {
    emit(GetInfoDataLoading());
    var response = await informationRepo.getInfoData();
    response.fold((error) {
      emit(GetInfoDataLoading());
    }, (data)
    {
      getInfoDataModel = data;
      print(getInfoDataModel!.data!.phones);
      emit(GetInfoDataSuccess(data));
    });
  }
}
