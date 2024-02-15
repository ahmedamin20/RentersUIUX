part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}
class FavouriteLoading extends FavouriteState {}
class FavouriteSuccess extends FavouriteState {}
class FavouriteError extends FavouriteState
{
  final String error;
  FavouriteError(this.error);
}
class ToggleFavouriteLoadingState extends FavouriteState
{
  int index;
  ToggleFavouriteLoadingState({required this.index});
}
class ToggleFavouriteSuccessState extends FavouriteState
{
  int index;
  ToggleFavouriteSuccessState({required this.index});
}
class ToggleFavouriteErrorState extends FavouriteState
{
  final String error;
  final int index;
  ToggleFavouriteErrorState(this.error , this.index );
}