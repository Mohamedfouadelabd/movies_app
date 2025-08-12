import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Api/api-const.dart';
import 'package:movies_app/Theme/my_theme.dart';
import 'package:movies_app/model/Response/MovieDiscoverSurceResponse.dart';

class MoviesDiscoverItem extends StatelessWidget {
Results results ;
MoviesDiscoverItem({required this.results});
  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
     children: [

       Container(
         color: Colors.blue,
         child: CachedNetworkImage(
           imageUrl: '${ApiConst.imageBaseURL}w500${results.posterPath}',
           placeholder: (context, url) => CircularProgressIndicator(
             color: MyTheme.yellow,

           ),
           errorWidget: (context, url, error) => Icon(Icons.error),
         ),
       ),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text(results.title??"",
  style: Theme.of(context).textTheme.titleLarge,
  ),
),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child:   Text(results.releaseDate??"",
           style: Theme.of(context).textTheme.titleLarge,
         ),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child:   Text(results.originalLanguage??"",
           style: Theme.of(context).textTheme.titleLarge,
         ),
       ),
     ],



    );
  }
}
