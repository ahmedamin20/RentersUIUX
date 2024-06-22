import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/core/helpers/dio_helpers/dio_helpers.dart';

import '../../../data/model/show_order_model/show_order_model.dart';

part 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit() : super(RequestsInitial());

  static RequestsCubit get(context) => BlocProvider.of(context);
  ShowOrderModel? showOrderModel;
  Future<void> getOrder(int status) async {
    emit(RequestsLoading());
    try {
      Response response =
          await DioHelper.getData(url: '/api/orders?incoming=$status',
          queryParameters: {
            "per_page": "100",
          }
          );
      showOrderModel = ShowOrderModel.fromJson(response.data);
      emit(RequestsSuccess(showOrderModel!));
    } catch (e) {
      emit(RequestsError(e.toString()));
      rethrow;
    }
  }

  Future<void> acceptOrder(int id) async {
    emit(RequestsOrderLoading());
    try {
      Response response =
          await DioHelper.postData(url: '/api/orders/$id/accept', data: {});

      emit(RequestsAcceptSuccess());
    } catch (e) {
      emit(RequestsAcceptError(e.toString()));
    }
  }

  Future<void> rejectOrder(int id) async {
    emit(RequestsOrderLoading());
    try {
      Response response =
          await DioHelper.postData(url: '/api/orders/$id/reject', data: {});

      emit(const RequestsAcceptSuccess());
    } catch (e) {
      emit(RequestsAcceptError(e.toString()));
    }
  }

  Future<void> cancelOrder(int id) async {
    emit(CancelOrderLoading());
    try {
      Response response =
          await DioHelper.postData(url: '/api/orders/$id/cancel', data: {});

      emit(CancelOrderSuccess());
    } catch (e) {
      emit(CancelOrderError(e.toString()));
    }
  }

  Future<void> makeOrder(int productId, String fromDate, String toDate) async {
    emit(MakeOrderRequestLoading());
    await DioHelper.postData(url: '/api/orders', data: {
      'product_id': productId,
      'from_date': fromDate,
      'to_date': toDate
    }).then((value) {
      emit(MakeOrderRequestSuccess());
    }).catchError((e) {
      emit(MakeOrderRequestError(e.toString()));
    });
  }
}
