import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Homescreen/%20Popular/Cubit/state.dart';

import '../domain/use_case.dart';

class PopularViewModel extends Cubit<PopularState>{
  PopularUseCase useCase;
  PopularViewModel(this .useCase):super(PopularLoadingState());

void getPopularResponse()async{
emit(PopularLoadingState());
try{
  var response=await useCase.invoke();
  if(response?.success==false){
    emit(PopularErrorState(errorMassage: response?.status_message));

  }else{
    emit(PopularsSuccessState(response: response));
  }
}catch(e){
  emit(PopularErrorState(errorMassage: e.toString()));
}

}

}