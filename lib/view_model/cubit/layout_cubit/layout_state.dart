part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}

class LayoutChangeBottomNavBar extends LayoutState {}
class ChangeMood extends LayoutState {}

class GetInfoDataLoading extends LayoutState {}
class GetInfoDataSuccess extends LayoutState {}
class GetInfoDataError extends LayoutState {}
