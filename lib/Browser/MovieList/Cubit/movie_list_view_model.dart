import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Browser/MovieList/Cubit/state.dart';

import '../domain/use-case.dart';

class MovieListViewModel extends Cubit<MovieListState>{
  MovieListUseCase useCase;

  MovieListViewModel(this.useCase):super(MovieListLoadingState());
void getMovieList()async{
  emit(MovieListLoadingState());
  try{
    var response=await useCase.invoke();
    if(response?.success==false){
      emit(MovieListErrorState(errorMassage: response?.status_message??""));
    }else {
      emit(MovieListSucssesState(response: response));
    }
  }catch(e){
    emit(MovieListErrorState(errorMassage: e.toString()));

  }
}

}