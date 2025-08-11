
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
@override
  void initState() {
    // TODO: implement initState
    viewModel.gertSimilar(widget.movieId.toString());
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarViewModel ,SimilarState>(
      bloc: viewModel,
        builder:(context, state) {
if(state is SimilarLoadingState ){
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
}
