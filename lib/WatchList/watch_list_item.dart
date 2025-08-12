

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Firebase/my_movie.dart';

import '../Firebase/FirebaseUtils/firebase_utils.dart';

class WatchListItem extends StatelessWidget {
  final MyMovie film;

  const WatchListItem({required this.film, super.key});

  @override
  Widget build(BuildContext context) {
    final String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

    return Container(
      padding: const EdgeInsets.only(top: 20, left: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: (film.images != null && film.images!.isNotEmpty)
                    ? Image.network(
                  film.images!.startsWith('http')
                      ? film.images!
                      : imageBaseUrl + film.images!,
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset(
                        'assets/images/image2.png',
                        width: 100,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                )
                    : Image.asset(
                  'assets/images/image2.png',
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.bookmark_remove, color: Colors.amber),
                onPressed: () {
                  FireBaseUtils .getMovieCollection().doc(film.id).delete();
                },
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    film.titel ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    film.dateTime?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    film.ratingNum ?? '',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
