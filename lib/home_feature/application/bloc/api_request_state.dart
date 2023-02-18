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

class ApiRequestInitial extends ApiRequestState {}

class ApiRequestLoading extends ApiRequestState {}

class ApiRequestLoaded extends ApiRequestState {
  final String advice;
  ApiRequestLoaded({required this.advice});
}

class ApiRequestError extends ApiRequestState {
  final String error;
  ApiRequestError({required this.error});
}
