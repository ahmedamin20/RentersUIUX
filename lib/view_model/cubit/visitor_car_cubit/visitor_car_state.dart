part of 'visitor_car_cubit.dart';

@immutable
abstract class VisitorCarState {}

class VisitorCarInitial extends VisitorCarState {}
class GetVisitorLoading extends VisitorCarState {}
class GetVisitorSuccess extends VisitorCarState
{
  final VisitorCarNewModel visitorCarModel;
  GetVisitorSuccess(this.visitorCarModel);
}
class GetVisitorError extends VisitorCarState
{
  final String error;
  GetVisitorError(this.error);
}
