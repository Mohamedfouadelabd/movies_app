import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Browser/MoviesDiscover/Cubit/state.dart';
import 'package:movies_app/Browser/MoviesDiscover/domain/use_case.dart';
import 'package:movies_app/Theme/my_theme.dart';

import '../../movie_discover_item.dart';
import 'movie_discover_view_model.dart';

class MovieDiscoverView extends StatefulWidget {
 String id;
 MovieDiscoverView({required this.id});

  @override
  State<MovieDiscoverView> createState() => _MovieDiscoverViewState();
}

class _MovieDiscoverViewState extends State<MovieDiscoverView> {
  MovieDiscoverViewModel viewModel =
      MovieDiscoverViewModel(injectMovieDiscoverUseCase());
  final ScrollController scrollController = ScrollController();

  int currentPage = 1;
  bool isLoadingMore = false;
  @override
  void initState() {
    // TODO: implement initState
    viewModel.getMovieDiscover(widget.id,page: currentPage);
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
    viewModel.getMovieDiscover(widget.id,page: currentPage);
    setState(() => isLoadingMore = false);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDiscoverViewModel, MovieDiscoverState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is MovieDiscoverLoadingState&&currentPage==1) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.yellow,
            ),
          );
        } else if (state is MovieDiscoverErrorState) {
          return Column(
            children: [
              Text(state.errorMassage ?? ""),
              ElevatedButton(onPressed: () {}, child: Text('TryAgain')),
            ],
          );
        } else if (state is MovieDiscoverSucssesState) {
          var movieDiscoverList = state.response?.results ?? [];
          return ListView.separated(
            controller: scrollController,
              itemBuilder: (context, index) {
                return MoviesDiscoverItem(
                  results: movieDiscoverList[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: Divider(
                    color: MyTheme.darkGray,
                    thickness: 5,
                  ),
                );
              },
              itemCount: movieDiscoverList.length);
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
