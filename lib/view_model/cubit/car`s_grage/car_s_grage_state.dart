part of 'car_s_grage_cubit.dart';

@immutable
abstract class CarSGrageState {}

class CarSGrageInitial extends CarSGrageState {}
class GetCarSGrageLoadingState extends CarSGrageState {}
class GetCarSGrageSuccessState extends CarSGrageState {}
class GetCarSGrageErrorState extends CarSGrageState {
  final String error;
  GetCarSGrageErrorState(this.error);
}

class CarSGrageLoading extends CarSGrageState {}
class CarSGrageSuccess extends CarSGrageState {
  CarSGrageSuccess();
}
class CarSGrageError extends CarSGrageState {
  final String error;
  CarSGrageError(this.error);
}

class GetBrandLoadingState extends CarSGrageState {}
class GetBrandSuccessState extends CarSGrageState {}
class GetBrandErrorState extends CarSGrageState {
  final String error;
  GetBrandErrorState(this.error);
}