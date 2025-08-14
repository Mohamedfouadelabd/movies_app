import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Homescreen/%20Similar/Cubit/state.dart';

import '../../../model/Response/SimilarSourceResponse.dart';
import '../Domain/use_case.dart';

class SimilarViewModel extends Cubit<SimilarState> {
  SimilarUseCase useCase;
  SimilarSourceResponse?allData;
  int totalPages = 1;
  SimilarViewModel(this.useCase) : super(SimilarLoadingState());

  void gertSimilar(String movieId,{int page=1}) async {
    if(page==1){
      emit(SimilarLoadingState());
  allData=null;
    }

    try {
      var response = await useCase.invoke(movieId,page: page);
      if (response?.success == false) {
        emit(SimilarErrorState(errorMassage: response?.status_message ?? ""));
      } else {
       totalPages=response?.totalResults??1;
       if (allData == null) {
         allData = response;
       } else {
         allData?.results?.addAll(response?.results ?? []);
       }
        emit(SimilarSucssesState(response: allData));
      }
    } catch (e) {
      emit(SimilarErrorState(errorMassage: e.toString()));
    }
  }
  bool canLoadMore(int currentPage) {
    return currentPage < totalPages;
  }

}
