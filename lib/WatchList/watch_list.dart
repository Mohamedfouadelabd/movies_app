import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:movies_app/WatchList/watch_list_item.dart';
import '../Firebase/FirebaseUtils/firebase_utils.dart';
import '../Firebase/my_movie.dart';
import '../Theme/my_theme.dart';


class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.12),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Watchlist',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),

        Expanded(
          child: StreamBuilder<QuerySnapshot<MyMovie>>(
            stream: FireBaseUtils.getMovieCollection().snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(child: Text('There was an error loading data.',
                  style: TextStyle(
                      color: MyTheme.white,
                      fontSize: 18
                  ),

                ));
              }

              var films = snapshot.data?.docs ?? [];

              if (films.isEmpty) {
                return const Center(child: Text('There are no movies in the watch list.',
               style: TextStyle(
                 color: MyTheme.white,
                 fontSize: 18
               ),

                ));
              }

              return ListView.separated(
                itemCount: films.length,
                itemBuilder: (context, index) {
                  final film = films[index].data();
                  return WatchListItem(film: film);
                },
                separatorBuilder: (context, index) => Divider(
                  thickness: 3,
                  color: MyTheme.darkGray,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
