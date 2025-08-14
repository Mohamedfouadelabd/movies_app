import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Browser/MoviesDiscover/Cubit/state.dart';

import '../../../model/Response/MovieDiscoverSurceResponse.dart';
import '../domain/use_case.dart';

class MovieDiscoverViewModel extends Cubit<MovieDiscoverState>{
  MovieDiscoverUseCase useCase;



  MovieDiscoverViewModel(this.useCase):super(MovieDiscoverLoadingState());
  MovieDiscoverSourceResponse? allData;
  int totalPages = 1;

  void getMovieDiscover(String id,{int page=1})async{
  if(page==1){
    emit(MovieDiscoverLoadingState());
 allData==null;
  }


  try{
  var response=await useCase.invoke(id,page: page);
if(response?.success==false){
  emit(MovieDiscoverErrorState(errorMassage: response?.status_message??""));

}else{
  totalPages = response?.totalPages ?? 1;

  if (allData == null) {
    allData = response;
  } else {
    allData?.results?.addAll(response?.results ?? []);
  }
  emit(MovieDiscoverSucssesState(response: allData));
}
} catch(e){
  emit(MovieDiscoverErrorState(errorMassage: e.toString()));
}



}

  bool canLoadMore(int currentPage) {
    return currentPage < totalPages;
  }
}