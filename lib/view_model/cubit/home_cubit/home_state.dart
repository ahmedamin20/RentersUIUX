part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}


// show all branch
class HomeLoading extends HomeState {}
class HomeSuccess extends HomeState {}
class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}


//branchs

class BranchLoading extends HomeState {}
class BranchSuccess extends HomeState {}
class BranchError extends HomeState {
  final String message;

  BranchError(this.message);
}


//branchAllProduct

class BranchAllProductLoading extends HomeState {}
class BranchAllProductSuccess extends HomeState {}
class BranchAllProductError extends HomeState {
  final String message;

  BranchAllProductError(this.message);
}

class BranchOneProductLoading extends HomeState {}
class BranchOneProductSuccess extends HomeState {}
class BranchOneProductError extends HomeState {
  final String message;

  BranchOneProductError(this.message);
}
class ChangeMenuSectionColor extends HomeState {}
class ChangeBranchColor extends HomeState {}
class CalculatePrice extends HomeState {}
class BackToDefault extends HomeState {}
class ChangeCountOfProduct extends HomeState {}
class AddToCartLoading extends HomeState {}
class AddToCartSuccess extends HomeState {
  final String message;

  AddToCartSuccess(this.message);
}
class AddToCartError extends HomeState
{
  final String message;

  AddToCartError(this.message);
}