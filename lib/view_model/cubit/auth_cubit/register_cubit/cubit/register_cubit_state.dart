part of 'register_cubit_cubit.dart';

sealed class RegisterCubitState extends Equatable {
  const RegisterCubitState();

  @override
  List<Object> get props => [];
}

final class RegisterCubitInitial extends RegisterCubitState {}

final class RegisterLoadingState extends RegisterCubitState {}

final class RegisterSuccessfulyState extends RegisterCubitState {}

final class RegisterErrorState extends RegisterCubitState {
  final String message;
  const RegisterErrorState(this.message);
}

final class PickImageSuccess extends RegisterCubitState {
  String pickImage;
  PickImageSuccess(this.pickImage);
}
