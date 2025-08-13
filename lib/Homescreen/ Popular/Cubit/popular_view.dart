import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Homescreen/ Popular/Cubit/popular_view-model.dart';
import 'package:movies_app/Homescreen/ Popular/Cubit/state.dart';
import 'package:movies_app/Homescreen/ Popular/domain/use_case.dart';
import 'package:movies_app/Homescreen/ Popular/popular_Item.dart';
import 'package:movies_app/Theme/my_theme.dart';

class PopularView extends StatefulWidget {
  @override
  State<PopularView> createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  PopularViewModel viewModel = PopularViewModel(injectPopularUseCase());
  final ScrollController scrollController = ScrollController();

  int currentPage = 1;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();

    viewModel.getPopularResponse(page: currentPage);

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
    viewModel.getPopularResponse(page: currentPage);
    setState(() => isLoadingMore = false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularViewModel, PopularState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is PopularLoadingState && currentPage == 1) {
          return const Center(
              child: CircularProgressIndicator(
            color: MyTheme.yellow,
          ));
        }

        if (state is PopularErrorState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.errorMassage ?? "An error occurred"),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    currentPage = 1;
                    viewModel.getPopularResponse(page: currentPage);
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          );
        }

        if (state is PopularsSuccessState) {
          var popularList = state.response?.results ?? [];

          return ListView.separated(
            controller: scrollController,
            itemCount: popularList.length ,
            separatorBuilder: (context, index) => Divider(
              color: MyTheme.yellow,
              thickness: 3,
            ),
            itemBuilder: (context, index) {
              return PopularItem(results: popularList[index]);
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
