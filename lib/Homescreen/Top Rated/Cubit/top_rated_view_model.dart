import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Homescreen/Top%20Rated/Cubit/state.dart';

import '../../../model/Response/TopRatedSourceResponse.dart';
import '../domain/use_case.dart';

class TopRatedViewModel extends Cubit<TopRatedState>{
  TopRatedUseCase useCase;
  TopRatedSourceResponse?allData;
  int totalPages = 1;
  TopRatedViewModel(this .useCase):super(TopRatedLoadingState());

  void getTopRatedResponse({int page=1})async {
if(page==1){
  emit(TopRatedLoadingState());
  allData=null;
}



  try{
   var response=await useCase.invoke(page:page );
 if(response?.success==false){
   emit(TopRatedErrorState(errorMassage: response?.status_message??''));
 }else{
 totalPages=response?.totalPages??1;
 if (allData == null) {
   allData = response;
 } else {
   allData?.results?.addAll(response?.results ?? []);
 }
   emit( TopRatedSucssesState(response: allData));

 }

 }catch(e){


   emit(TopRatedErrorState(errorMassage: e.toString()));

 }


}
  bool canLoadMore(int currentPage) {
    return currentPage < totalPages;
  }
}