import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Homescreen/%20Upcoming/Cubit/state.dart';

import '../domain/use_case.dart';

class UpcomingViewModel extends Cubit<UpcomingState>{
  UpcomingUseCase useCase;
  UpcomingViewModel(this.useCase):super(UpcomingLoadingState());
void getUpcomingResponse()async{
emit(UpcomingLoadingState());
try{
  var response=await useCase.invoke();
if(response?.success==false){
  emit(UpcomingErrorState(errorMassage: response?.status_message??"Error"));

}else{
  emit(UpcomingSucsesState(response: response));

}
}catch(e){
  emit(UpcomingErrorState(errorMassage: e.toString()));

}


}

}