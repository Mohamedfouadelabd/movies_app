import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Api/api-const.dart';
import 'package:movies_app/model/Response/PopularSourceResponse.dart';

import '../Theme/my_theme.dart';

class SearchItem extends StatelessWidget {
Results results;
SearchItem({required this.results});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Container(


          height: MediaQuery.of(context).size.height*0.17,

          child: Row(
            children: [
              Container(


                child: CachedNetworkImage(
                  imageUrl: '${ApiConst.imageBaseURL}w500${results.posterPath}',
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: MyTheme.yellow,

                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child:Text(
                      results.title ?? "",
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )



                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(results.releaseDate??'',
                      style: Theme.of(context).textTheme.titleSmall,

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(results.originalLanguage??"",
                      style: Theme.of(context).textTheme.titleSmall,

                    ),
                  ),
                ],
              ),
            ],
          ),


        ),
      ],
    );
  }
}
