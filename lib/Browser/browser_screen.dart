

import 'package:flutter/material.dart';

import 'MovieList/Cubit/movie_list_view.dart';
import 'browser_item.dart';

class BrowserScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.15,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Browse Category ',
          style: Theme.of(context).textTheme.titleLarge,

          ),
        ),
        Expanded(child: MovieListView()),
      ],

    );
  }
}
