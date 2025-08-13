import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Homescreen/%20Popular/Cubit/state.dart';
import '../domain/use_case.dart';
import 'package:movies_app/model/Response/PopularSourceResponse.dart';

class PopularViewModel extends Cubit<PopularState> {
  PopularUseCase useCase;

  PopularSourceResponse? allData;
  int totalPages = 1;

  PopularViewModel(this.useCase) : super(PopularLoadingState());

  void getPopularResponse({int page = 1}) async {
    if (page == 1) {
      emit(PopularLoadingState());
      allData = null;
    }

    try {
      var response = await useCase.invoke(page: page);

      if (response?.success == false) {
        emit(PopularErrorState(errorMassage: response?.status_message??""));
      } else {
        totalPages = response?.totalPages ?? 1;

        if (allData == null) {
          allData = response;
        } else {
          allData?.results?.addAll(response?.results ?? []);
        }

        emit(PopularsSuccessState(response: allData));
      }
    } catch (e) {
      emit(PopularErrorState(errorMassage: e.toString()));
    }
  }

  bool canLoadMore(int currentPage) {
    return currentPage < totalPages;
  }
}
