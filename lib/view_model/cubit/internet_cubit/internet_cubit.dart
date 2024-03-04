import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState>
{
  InternetCubit() : super(InternetInitial());
  static InternetCubit get(context) => BlocProvider.of(context);
  StreamSubscription ?streamSubscription;
  void checkConnectivity()
  {
    streamSubscription = Connectivity().onConnectivityChanged.listen((event) {
      if(event == ConnectivityResult.mobile || event == ConnectivityResult.wifi)
        {
          emit(InternetConnected());
        }else
          {
            emit(InternetDisconnected());
          }
    });
  }
  void changeInternetStatus({required bool status})
  {
    if(status)
      {
        emit(InternetConnected());
      }else
        {
          emit(InternetDisconnected());
        }
  }
}
