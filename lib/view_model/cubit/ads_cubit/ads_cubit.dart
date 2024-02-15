import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/ads_model/ads_model.dart';
import '../../../data/repository/ads_repo/ads_repo.dart';

part 'ads_state.dart';

class AdsCubit extends Cubit<AdsState>
{
  AdsCubit(this._adsRepo) : super(AdsInitial());
  static AdsCubit get(context) => BlocProvider.of(context);
  AdsRepo _adsRepo;
  void getAds()
  {
    emit(AdsLoading());
    _adsRepo.getAds().then((value)
    {
      value.fold((error) {
        emit(AdsError(error.toString()));
      }, (value) {
        emit(AdsSuccess(value));
      });
    });
  }
}
