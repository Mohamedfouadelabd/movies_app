import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Homescreen/%20Similar/Cubit/state.dart';

import '../Domain/use_case.dart';

class SimilarViewModel extends Cubit<SimilarState> {
  SimilarUseCase useCase;
  SimilarViewModel(this.useCase) : super(SimilarLoadingState());

  void gertSimilar(String movieId) async {
    emit(SimilarLoadingState());
    try {
      var response = await useCase.invoke(movieId);
      if (response?.success == false) {
        emit(SimilarErrorState(errorMassage: response?.status_message ?? ""));
      } else {
        emit(SimilarSucssesState(response: response));
      }
    } catch (e) {
      emit(SimilarErrorState(errorMassage: e.toString()));
    }
  }
}
