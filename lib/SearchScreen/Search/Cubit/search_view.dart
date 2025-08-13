

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/SearchScreen/Search/Cubit/search_view_model.dart';
import 'package:movies_app/SearchScreen/Search/Cubit/state.dart';
import 'package:movies_app/SearchScreen/Search/domain/use_case.dart';
import 'package:movies_app/Theme/my_theme.dart';

import '../../search_item.dart';

class SearchView extends StatefulWidget {
  String query;
  SearchView({required this.query});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SearchViewModel viewModel =SearchViewModel(injectSearchUseCase());
@override
  void initState() {
  super.initState();
    // TODO: implement initState
    viewModel.search(widget.query);
  }
  @override
  @override
  void didUpdateWidget(covariant SearchView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.query != widget.query) {
      viewModel.search(widget.query);
    }
  }
  Widget build(BuildContext context) {
    return BlocBuilder< SearchViewModel ,SearchState>(
        bloc: viewModel,
        builder: (context, state) {
       if(state is SearchLoadingState){
         return Center(
           child: CircularProgressIndicator(
             color: MyTheme.yellow,
           ),
         );

       }   else if(state is SearchErrorState){
         return Column(
           children: [
             Text(state.errorMassage ?? ""),
             ElevatedButton(onPressed: () {}, child: Text('TryAgain')),
           ],
         );

       }else if(state is SearchSucssesState){
         var searchList= state.response?.results??[];
         return
       ListView.separated(
         separatorBuilder: (context, index) {
           return Divider(
             color: MyTheme.darkGray,
             thickness: 3,
           );
         },
         itemCount: searchList.length,
             itemBuilder: (context, index) {

             return SearchItem(results:searchList[index]);


           },  );


       }














        return Container();
          },

    );
  }
}
