import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Homescreen/Top%20Rated/Cubit/state.dart';

import '../domain/use_case.dart';

class TopRatedViewModel extends Cubit<TopRatedState>{
  TopRatedUseCase useCase;

  TopRatedViewModel(this .useCase):super(TopRatedLoadingState());

  void getTopRatedResponse()async {

  emit(TopRatedLoadingState());
  try{
   var response=await useCase.invoke();
 if(response?.success==false){
   emit(TopRatedErrorState(errorMassage: response?.status_message??''));
 }else{
   emit( TopRatedSucssesState(response: response));

 }

 }catch(e){
   emit(TopRatedErrorState(errorMassage: e.toString()));

 }


}

}