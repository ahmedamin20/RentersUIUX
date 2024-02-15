part of 'ads_cubit.dart';

@immutable
abstract class AdsState {}

class AdsInitial extends AdsState {}

class AdsLoading extends AdsState {}
class AdsSuccess extends AdsState {
  final AdsModel adsModel;

  AdsSuccess(this.adsModel);
}
class AdsError extends AdsState {
  final String error;

  AdsError(this.error);
}
