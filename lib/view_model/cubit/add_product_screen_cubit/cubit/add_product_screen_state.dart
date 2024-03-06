part of 'add_product_screen_cubit.dart';

abstract class AddProductScreenState {

 
}

class AddProductScreenInitial extends AddProductScreenState {}
class AddProductScreenPickImageSuccess extends AddProductScreenState {}

class AddProductScreenLoading extends AddProductScreenState {}
class AddProductScreenSuccess extends AddProductScreenState {}
class AddProductScreenError extends AddProductScreenState 
{
  final String error;
  AddProductScreenError(this.error);
}
