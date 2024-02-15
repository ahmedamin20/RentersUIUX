import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/data/model/get_product_detiales_model/get_product_detiles_model.dart';
import 'package:ksb/data/model/product_model/product_model.dart';
import 'package:meta/meta.dart';

import '../../../core/services/error/failuar.dart';
import '../../../data/repository/get_product_repo/gert_product_repo.dart';

part 'recommended_item_details_state.dart';

class RecommendedItemDetailsCubit extends Cubit<RecommendedDetailsItemStates>
{
  RecommendedItemDetailsCubit() : super(RecommendedDetailsStateInitial());
  static  RecommendedItemDetailsCubit get(context) => BlocProvider.of(context);


}
