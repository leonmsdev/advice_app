// --------- Events that happen in the ui -------------------
//
// Das "event" File listet alle möglichen Events innerhalb
// der UI da. Dabei erweitert man die basis Klasse mit den
// möglichen Events. (In diesem Fall die ApiRequestEvent)
// --------- Bloc event -------------------------------------
//
// Um ein Ebent zu triggern, muss der block mit der name.add()
// Funktion ausgeführt werden. In der add(ApiRequestedEvent)
// Funktion wird dann der Name vom Event angezeigt.
// ---------------------------------------------------------
part of './api_request_bloc.dart';

@immutable
abstract class ApiRequestEvent {}

/// Event when button is pressed and sould call the api request.
class ApiRequestedEvent extends ApiRequestEvent {}
