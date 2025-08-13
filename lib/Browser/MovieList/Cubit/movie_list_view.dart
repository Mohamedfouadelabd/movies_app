
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Browser/MovieList/Cubit/state.dart';
import 'package:movies_app/Browser/MovieList/domain/use-case.dart';
import 'package:movies_app/Theme/my_theme.dart';

import '../../browser_item.dart';
import 'movie_list_view_model.dart';

class MovieListView extends StatefulWidget {
  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  MovieListViewModel viewModel =MovieListViewModel(injectMovieListUseCase());
@override
  void initState() {
    // TODO: implement initState
    viewModel.getMovieList();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder< MovieListViewModel,MovieListState>(
      bloc:  viewModel,
      builder: (context, state) {
if(state is MovieListLoadingState){
  return Center(
    child: CircularProgressIndicator(
      color: MyTheme.yellow,
    ),
  );

}else if (state is MovieListErrorState){
  return Column(
    children: [
      Text(state.errorMassage ?? ""),
      ElevatedButton(onPressed: () {}, child: Text('TryAgain')),
    ],
  );

}else if(state is MovieListSucssesState){
  var movieList=state.response?.genres??[];
  return GridView.builder(
   itemCount: movieList.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio:1.5,
      mainAxisSpacing: 2,


    ),
    itemBuilder: (context, index) {
      return BrowserItem(genres: movieList[index],);
    },
  );
}
         return Container();
        },
    );
  }
}
