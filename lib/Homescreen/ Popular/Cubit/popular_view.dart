

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Homescreen/%20Popular/Cubit/popular_view-model.dart';
import 'package:movies_app/Homescreen/%20Popular/Cubit/state.dart';
import 'package:movies_app/Homescreen/%20Popular/domain/use_case.dart';
import 'package:movies_app/Homescreen/%20Popular/popular_Item.dart';
import 'package:movies_app/Theme/my_theme.dart';

class PopularView extends StatefulWidget {
  @override
  State<PopularView> createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  PopularViewModel viewModel=PopularViewModel(injectPopularUseCase());
@override
  void initState() {
    viewModel.getPopularResponse();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder< PopularViewModel,PopularState>(
        bloc: viewModel,

        builder:(context, state) {
if(state is PopularLoadingState){
  return Center(
    child: CircularProgressIndicator(
      color: MyTheme.yellow,
    ),
  );
}else if(state is PopularErrorState){
  return Column(
    children: [
      Text(state.errorMassage ?? ""),
      ElevatedButton(onPressed: () {}, child: Text('TryAgain')),
    ],
  );

}else if(state is PopularsSuccessState){
  var popularList=state.response?.results??[];
  return ListView.separated(
      itemBuilder: (context, index) {
        return PopularItem(results: popularList[index],);
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: MyTheme.yellow,
          thickness: 3,
        );
      },
      itemCount: popularList.length);
}
    return Container();
        },

    );
  }
}
/*

 */