import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/SearchScreen/Search/Cubit/state.dart';

import '../domain/use_case.dart';

class SearchViewModel extends Cubit<SearchState>{
  SearchUseCase useCase;
  SearchViewModel(this.useCase):super(SearchLoadingState());

void search(String query)async {
  emit(SearchLoadingState());
 try{
   var response=await useCase.invoke(query);
 if(response?.success==false){
   emit(SearchErrorState(errorMassage: response?.status_message??''));
 }else {
   emit(SearchSucssesState(response: response));

 }
 }catch(e){
   emit(SearchErrorState(errorMassage: e.toString()));

 }

}


}