
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Homescreen/%20Similar/Cubit/similar_view_model.dart';
import 'package:movies_app/Homescreen/%20Similar/Cubit/state.dart';
import 'package:movies_app/Homescreen/%20Similar/Domain/use_case.dart';
import 'package:movies_app/Theme/my_theme.dart';

import '../similar_Item.dart';

class SimilarView extends StatefulWidget {
 int movieId;
 SimilarView({required this.movieId});
 @override
  State<SimilarView> createState() => _SimilarViewState();
}

class _SimilarViewState extends State<SimilarView> {
  SimilarViewModel viewModel= SimilarViewModel(injectSimilarUseCase());
  final ScrollController scrollController = ScrollController();

  int currentPage = 1;
  bool isLoadingMore = false;

  @override
  void initState() {
    // TODO: implement initState
    viewModel.gertSimilar(widget.movieId.toString(),page: currentPage);
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
    viewModel.gertSimilar(widget.movieId.toString(),page: currentPage);
    setState(() => isLoadingMore = false);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarViewModel ,SimilarState>(
      bloc: viewModel,
        builder:(context, state) {
if(state is SimilarLoadingState &&currentPage==1 ){
  return CircularProgressIndicator(
    color: MyTheme.yellow,
  );
}else if(state is SimilarErrorState) {
  return Column(
    children: [
      Text(state.errorMassage ?? ""),
      ElevatedButton(onPressed: () {}, child: Text('TryAgain')),
    ],
  );
}else if(state is SimilarSucssesState){
  var similarList=state.response?.results??[];
  return ListView.builder(
  controller: scrollController,
    scrollDirection:  Axis.horizontal,
    itemCount: similarList.length,
      itemBuilder: (context, index) {
        return SimilarItem(results:similarList[index] ,);
      },

  );

}

















    return Container();
          },

    );
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
