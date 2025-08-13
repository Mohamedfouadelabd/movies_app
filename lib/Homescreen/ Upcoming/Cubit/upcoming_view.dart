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
  final UpcomingViewModel viewModel = UpcomingViewModel(injectUpcomingUseCase());
  final ScrollController scrollController = ScrollController();

  int currentPage = 1;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    viewModel.getUpcomingResponse(page: currentPage);

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
   viewModel.getUpcomingResponse(page: currentPage);
    setState(() => isLoadingMore = false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingViewModel, UpcomingState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is UpcomingLoadingState && currentPage == 1) {

          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.yellow,
            ),
          );
        } else if (state is UpcomingErrorState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.errorMassage ?? ""),
              ElevatedButton(
                onPressed: () {
                  currentPage = 1;
                  viewModel.getUpcomingResponse(page: currentPage);
                },
                child: const Text('Try Again'),
              ),
            ],
          );
        } else if (state is UpcomingSucsesState) {
          var upcomingList = state.response?.results ?? [];

          return ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: upcomingList.length ,
            itemBuilder: (context, index) {

              return UpcomingItem(results: upcomingList[index]);
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
