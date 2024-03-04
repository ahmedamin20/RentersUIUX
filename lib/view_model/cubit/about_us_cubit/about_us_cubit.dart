import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/about_us_model/about_us_model.dart';
import '../../../data/repository/about_us_repo/about_us_repo.dart';

part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit(this.aboutUsRepo) : super(AboutUsInitial());
  static AboutUsCubit get(context) => BlocProvider.of(context);
  AboutUsRepo aboutUsRepo;
  AboutUsModel? aboutUsModel;
  Future<void> getAboutUs() async {
    emit(AboutUsLoadingState());
    final response = await aboutUsRepo.getAboutUs();
    response.fold((error) {
      emit(AboutUsErrorState(error.message));
    }, (data) {
      aboutUsModel = data;
      emit(AboutUsSuccessState(data));
    });
  }


}
