

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
  final ScrollController scrollController = ScrollController();

  int currentPage = 1;
  bool isLoadingMore = false;
  @override
  void initState() {
    // TODO: implement initState
    viewModel.getTopRatedResponse(page: currentPage);
    scrollController.addListener(() {
      final position = scrollController.position;
      if (position.pixels >= position.maxScrollExtent - 200 &&
          !isLoadingMore &&
          viewModel.canLoadMore(currentPage)) {
        loadMore();
      }
    });
  }
  Future<void> loadMore() async {
    setState(() => isLoadingMore = true);
    currentPage++;
    viewModel.getTopRatedResponse(page: currentPage);
    setState(() => isLoadingMore = false);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedViewModel ,TopRatedState>(
bloc: viewModel,
      builder:(context, state) {
if(state is TopRatedLoadingState && currentPage == 1){
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
  controller: scrollController ,
    itemCount: topRatedList.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) => TopratedItem(results:topRatedList[index] ),
  );

}
return Container();
    },);
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
