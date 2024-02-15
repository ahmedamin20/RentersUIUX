part of 'location_cubit.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}
class LocationLoading extends LocationState {}
class LocationLoaded extends LocationState {
  final String address;
  LocationLoaded(this.address);
}
class LocationError extends LocationState {
  final String error;
  LocationError(this.error);
}
// check permission
class LocationPermissionDenied extends LocationState {
  final String error;
  LocationPermissionDenied(this.error);
}
class LocationPermissionGranted extends LocationState {
  final String message;
  LocationPermissionGranted(this.message);
}