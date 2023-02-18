// --------- Manage the Bloc logic --------------------------
//
// Definiert die einzelnen Events mit on((event, emit) {})
// Dabei werden in den einzelnen events die möglichen States
// definiert.
//
// Einzelne States lassen sich innerhalb des events mit
// einem emit(NAME_OF_EVENT()) definieren. Ein Event wird
// von oben nach unten verarbeitet.
// --------- Bloc builder -----------------------------------
//
// Blockbuilder erstellt eine dynamische UI, welche auf den
// State innerhalbd er UI hört. Dieser ist ein Widget namens
// und wird wie folgt definiert.
//
//    final apiRequestBloc = ApiRequestBloc();
//
//    BlocBuilder<ApiRequestBloc, ApiRequestState>(
//    bloc: apiRequestBloc,
//    builder: (context,apiRequesState){
//      },
//    )
// --------- Bloc Provider ---------------------------------
//
// Der Bloc Provider ermöglicht es einen Bloc in den gesmaten
// child Widgets zu nutzen. Dabei wird das jeweilige Widget
// mit einem BlocProvider gewrapped und unter create: wird
// auf den Bloc referenziert.
//
// Mit BlocProvider.of<Type>(context) kann man dann im
// BlockBuiklder unter bloc: darauf referenzieren.
//
// bloc: BlocProvider.of<ApiRequestBloc>(context),
// BlocProvider.of<ApiRequestBloc>(context).add(ApiRequestedEvent());
//
// --------- Events im Init State ausführen -----------------
//
// Lädt einen Block direkt beim Initialisieren. Dafür muss
// der Bloc mit der ..add() Methode definiert werden.
//
// bloc: BlocProvider.of<ApiRequestBloc>(context)..add(ApiRequestedEvent()),
//
// --------- buildWhen -------------------------------------
//
// Die buildWhen function ermöglicht das bauen eines widget,
// wenn eine Desingung eintrofft. Es muss immer ein true oder
// false ausgegeben werden.
//
// Zum Beispiel:
// buildWhen: (previusState,currentState){return true}
// ---------------------------------------------------------

import 'package:bloc/bloc.dart';
import 'package:bloc_app/home_feature/domain/entities/advice_entity.dart';
import 'package:bloc_app/home_feature/domain/failures/failures.dart';
import 'package:bloc_app/home_feature/domain/usecases/advicer_usecases.dart';
import 'package:dartz/dartz.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part './api_request_event.dart';
part './api_request_state.dart';

class ApiRequestBloc extends Bloc<ApiRequestEvent, ApiRequestState> {
  final AdvicerUseCases usecase = AdvicerUseCases();

  ApiRequestBloc() : super(ApiRequestInitial()) {
    on<ApiRequestEvent>((event, emit) async {
      emit(ApiRequestLoading());

      Either<AdviceEntity, Failure> adviceOrFailure =
          await usecase.getAdviceUsecase();

      //If usecase gives error than state retunres falure otherwise the advice get shown
      adviceOrFailure.fold(
        (advice) => emit(ApiRequestLoaded(advice: advice.advice)),
        (failure) => emit(ApiRequestError(
          error: _mapFailureToError(failure),
        )),
      );
    });
  }

  String _mapFailureToError(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Error: ${failure.runtimeType} ~ could not communicate with the server.';
      case GeneralFailure:
        return 'Error: ${failure.runtimeType} ~ Could not define error.';

      default:
        return 'Error: ${failure.runtimeType} ~ Could not define error.';
    }
  }
}
