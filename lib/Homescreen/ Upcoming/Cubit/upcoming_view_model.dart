import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Homescreen/%20Upcoming/Cubit/state.dart';

import '../../../model/Response/UpComingSourceResponse.dart';
import '../domain/use_case.dart';

class UpcomingViewModel extends Cubit<UpcomingState>{
  UpcomingUseCase useCase;
  UpComingSourceResponse? allData;
  int totalPages = 1;
  UpcomingViewModel(this.useCase):super(UpcomingLoadingState());



  void getUpcomingResponse({int page = 1})async{
if(page==1){
  emit(UpcomingLoadingState());
allData=null;
}


try{
  var response=await useCase.invoke(page: page);
if(response?.success==false){
  emit(UpcomingErrorState(errorMassage: response?.status_message??"Error"));

}else{
  totalPages=response?.totalPages??1;
  if (allData == null) {
    allData = response;
  } else {
    allData?.results?.addAll(response?.results ?? []);
  }
  emit(UpcomingSucsesState(response: allData));

}
}catch(e){
  emit(UpcomingErrorState(errorMassage: e.toString()));

}


}
  bool canLoadMore(int currentPage) {
    return currentPage < totalPages;
  }
}