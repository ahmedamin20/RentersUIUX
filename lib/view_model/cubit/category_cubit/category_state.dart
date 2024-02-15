part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}
class CategorySuccess extends CategoryState {

}
class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}
