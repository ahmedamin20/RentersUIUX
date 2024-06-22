part of 'register_cubit_cubit.dart';

sealed class RegisterCubitState {
  const RegisterCubitState();
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

final class PickBackImageSuccess extends RegisterCubitState {
  String pickImage;
  PickBackImageSuccess(this.pickImage);
}

final class PickAvatarImageSuccess extends RegisterCubitState {
  String pickImage;
  PickAvatarImageSuccess(this.pickImage);
}
