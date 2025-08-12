import 'package:flutter/material.dart';
import 'package:movies_app/Theme/my_theme.dart';

import '../model/Response/MoveListSourceResponse.dart';
import 'MoviesDiscover/Cubit/movie_discover_view.dart';
import 'movie_discover_item.dart';

class MovieDiscoverScreen extends StatelessWidget {
  static const String routeName='movies_discover_screen';

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)!.settings.arguments as Genres;
    return Scaffold(
     appBar: AppBar(
       title:Text('Browse Category',
         style: Theme.of(context).textTheme.titleLarge,
       ),
     ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
          ),
          Expanded(child: MovieDiscoverView(id: args.id.toString())),
        ],


      ),
    );
  }
}
