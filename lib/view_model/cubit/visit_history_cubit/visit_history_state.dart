part of 'visit_history_cubit.dart';

@immutable
abstract class VisitHistoryState {}

class VisitHistoryInitial extends VisitHistoryState {}
class VisitHistoryLoading extends VisitHistoryState {}
class VisitHistorySuccess extends VisitHistoryState {
  // final VisitHistoryModel visitHistoryModel;
  // VisitHistorySuccess(this.visitHistoryModel);
}
class VisitHistoryError extends VisitHistoryState {
  final String message;
  VisitHistoryError(this.message);
}

class VisitHistoryDetailsLoading extends VisitHistoryState {}
class VisitHistoryDetailsSuccess extends VisitHistoryState {
  final GetVisitHistoryDetailsModel visitHistoryModelDetailes;
  VisitHistoryDetailsSuccess(this.visitHistoryModelDetailes);
}
class VisitHistoryDetailsError extends VisitHistoryState {
  final String message;
  VisitHistoryDetailsError(this.message);
}