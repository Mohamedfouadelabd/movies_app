import 'package:flutter/material.dart';
import 'package:movies_app/Homescreen/%20Upcoming/Cubit/upcoming_view.dart';
import 'package:movies_app/Theme/my_theme.dart';

import ' Popular/Cubit/popular_view.dart';
import ' Popular/popular_Item.dart';
import ' Upcoming/upcoming_Item.dart';
import 'Top Rated/Cubit/top_rated_view.dart';
import 'Top Rated/toprated_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          width: double.infinity,
          child: PopularView(),
        ),

        // New Releases
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 6, bottom: 6),
          child: Text(
            'New Releases',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.24,
          color: MyTheme.darkGray,
          child: UpcomingView(),
        ),

        // Recommended
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 6),
          child: Text(
            'Recommended',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Container(
          height: MediaQuery.of(context).size.height * 0.24,
          color: MyTheme.darkGray,
          child: TopRatedView(),
        ),
      ],
    );
  }
}
