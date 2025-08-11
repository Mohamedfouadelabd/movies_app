import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/Response/PopularSourceResponse.dart';

import ' Similar/Cubit/similar_view.dart';

import '../Api/api-const.dart';
import '../Theme/my_theme.dart';

class HomeScreenDetils extends StatefulWidget {
  static const String routeName = 'home_screen_detils';

  @override
  State<HomeScreenDetils> createState() => _HomeScreenDetilsState();
}

class _HomeScreenDetilsState extends State<HomeScreenDetils> {
  bool select = true;

  @override
  Widget build(BuildContext context) {
   var args=ModalRoute.of(context)!.settings.arguments as Results;
    return Scaffold(

      appBar: AppBar(
        title: Text(
          args.title??"",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              imageUrl: '${ApiConst.imageBaseURL}w500${args.posterPath}',
              placeholder: (context, url) => CircularProgressIndicator(
                color: MyTheme.yellow,

              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    child: CachedNetworkImage(
                      imageUrl: '${ApiConst.imageBaseURL}w154${args.posterPath}',
                      placeholder: (context, url) => CircularProgressIndicator(
                        color: MyTheme.yellow,

                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
Column(
  children: [

    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        args.title ?? "",
        style: Theme.of(context).textTheme.titleLarge,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'date:  ${args.releaseDate ?? ""}',
        style: Theme.of(context).textTheme.titleLarge,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    ),

    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'voteAverage:  ${args.voteAverage.toString()??""}',
        style: Theme.of(context).textTheme.titleLarge,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
      'voteCount:  ${args.voteCount.toString().toString()??""}',
        style: Theme.of(context).textTheme.titleLarge,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    ),
  ],
),

                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('More Like This',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.24,
              width: double.infinity,
              decoration: BoxDecoration(color: MyTheme.darkGray),
              child:SimilarView(movieId:args.id!) ,
            ),
          ],
        ),
      ),
    );
  }
}
