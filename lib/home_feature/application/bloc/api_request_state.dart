// --------- States of the bloc -----------------------------
//
// Definiert die verschiedenen States innerhlab des Bloc's
// Dies kann beispielsweise loading, error oder done sein.
//
// Initial State ist der State, welcher nach dem
// initialisieren das Widgets (fertig laden) angezeigt wird.
// ---------------------------------------------------------

part of './api_request_bloc.dart';

@immutable
abstract class ApiRequestState {}

class ApiRequestInitial extends ApiRequestState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class ApiRequestLoading extends ApiRequestState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class ApiRequestLoaded extends ApiRequestState with EquatableMixin {
  final String advice;
  ApiRequestLoaded({required this.advice});
  @override
  List<Object?> get props => [];
}

class ApiRequestError extends ApiRequestState with EquatableMixin {
  final String error;
  ApiRequestError({required this.error});
  @override
  List<Object?> get props => [];
}
