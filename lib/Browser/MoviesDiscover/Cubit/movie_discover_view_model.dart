import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Browser/MoviesDiscover/Cubit/state.dart';

import '../domain/use_case.dart';

class MovieDiscoverViewModel extends Cubit<MovieDiscoverState>{
  MovieDiscoverUseCase useCase;

  MovieDiscoverViewModel(this.useCase):super(MovieDiscoverLoadingState());

void getMovieDiscover(String id)async{
emit(MovieDiscoverLoadingState());
  try{
  var response=await useCase.invoke(id);
if(response?.success==false){
  emit(MovieDiscoverErrorState(errorMassage: response?.status_message??""));

}else{

  emit(MovieDiscoverSucssesState(response: response));
}
} catch(e){
  emit(MovieDiscoverErrorState(errorMassage: e.toString()));
}



}


}