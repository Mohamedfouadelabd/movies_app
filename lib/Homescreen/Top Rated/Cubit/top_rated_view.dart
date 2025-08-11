

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Homescreen/Top%20Rated/Cubit/state.dart';
import 'package:movies_app/Homescreen/Top%20Rated/Cubit/top_rated_view_model.dart';
import 'package:movies_app/Homescreen/Top%20Rated/domain/use_case.dart';
import 'package:movies_app/Theme/my_theme.dart';

import '../toprated_item.dart';

class TopRatedView extends StatefulWidget {

  @override
  State<TopRatedView> createState() => _TopRatedViewState();
}

class _TopRatedViewState extends State<TopRatedView> {
  TopRatedViewModel viewModel=TopRatedViewModel(injectTopRatedUseCase());
@override
  void initState() {
    // TODO: implement initState
    viewModel.getTopRatedResponse();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedViewModel ,TopRatedState>(
bloc: viewModel,
      builder:(context, state) {
if(state is TopRatedLoadingState){
  return Center(
    child: CircularProgressIndicator(
      color: MyTheme.yellow,
    ),
  );
}else if(state is TopRatedErrorState){
  return Column(
    children: [
      Text(state.errorMassage ?? ""),
      ElevatedButton(onPressed: () {}, child: Text('TryAgain')),
    ],
  );

}else if(state is TopRatedSucssesState){
  var topRatedList=state.response?.results??[];
  return ListView.builder(
    itemCount: topRatedList.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) => TopratedItem(results:topRatedList[index] ),
  );

}
return Container();
    },);
  }
}
