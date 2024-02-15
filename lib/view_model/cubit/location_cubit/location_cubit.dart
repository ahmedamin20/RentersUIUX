import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:ksb/view_model/cubit/internet_cubit/internet_cubit.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';

import '../../../core/helpers/location_helpers/location_helpers.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  final LocationHelpers _locationHelpers = LocationHelpers.instance;
  // void getLocation()=> _locationHelpers.updateMyLocation();
  List<Placemark> ? placemarks ;
  String ? address;
  LocationData ? locationData;
  Future<void> getLocation()
 async
 {
    emit(LocationLoading());
  var value = await  _locationHelpers.updateMyLocation();
  if(value)
  {
    print("Location Permission Granted");
    emit(LocationPermissionGranted("Location Permission Granted"));
  }else{
    emit(LocationError("Permission Denied"));
  }
  }
  Future<void> getAddresss()
 async  {
    // emit(LocationLoading());
    if(_locationHelpers.currentLocation == null)
      {
        emit(LocationError("Location Not Found"));
        return ;
      }
       _locationHelpers.getAddress(_locationHelpers.currentLocation!.latitude! , _locationHelpers.currentLocation!.longitude!).then((value)
       {
         placemarks = value;
         locationData = _locationHelpers.currentLocation;
         address = "${placemarks![0].name} ${placemarks![0].street} ${placemarks![0].locality} ${placemarks![0].country}";
      emit(LocationLoaded("${placemarks![0].name} ${placemarks![0].street} ${placemarks![0].locality} ${placemarks![0].country}"));
    }).catchError((e){
      emit(LocationError(e.toString()));
    });
  }
}
