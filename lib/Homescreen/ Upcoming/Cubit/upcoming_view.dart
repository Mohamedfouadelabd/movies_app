
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Homescreen/%20Upcoming/Cubit/state.dart';
import 'package:movies_app/Homescreen/%20Upcoming/Cubit/upcoming_view_model.dart';
import 'package:movies_app/Theme/my_theme.dart';

import '../domain/use_case.dart';
import '../upcoming_Item.dart';


class UpcomingView extends StatefulWidget {

  @override
  State<UpcomingView> createState() => _UpcomingViewState();
}

class _UpcomingViewState extends State<UpcomingView> {
  UpcomingViewModel viewModel=UpcomingViewModel(injectUpcomingUseCase());
@override
  void initState() {
    // TODO: implement initState
    viewModel.getUpcomingResponse();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder< UpcomingViewModel,UpcomingState>(
      bloc: viewModel,
      builder: (context, state) {
if(state is UpcomingLoadingState ){
  return Center(
    child: CircularProgressIndicator(
      color: MyTheme.yellow,
    ),
  );

}else if(state is UpcomingErrorState){
  return Column(
    children: [
      Text(state.errorMassage ?? ""),
      ElevatedButton(onPressed: () {}, child: Text('TryAgain')),
    ],
  );

}else if(state is UpcomingSucsesState){
  var upcomingList=state.response?.results??[];
 return  ListView.builder(
   itemCount: upcomingList.length,
   scrollDirection: Axis.horizontal,
   itemBuilder: (context, index) => UpcomingItem(results:upcomingList[index] ),
 );
}
 return Container();
    },);
  }
}
