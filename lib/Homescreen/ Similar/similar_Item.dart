

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Api/api-const.dart';
import '../../Firebase/FirebaseUtils/firebase_utils.dart';
import '../../Firebase/my_movie.dart';
import '../../Theme/my_theme.dart';
import '../../model/Response/SimilarSourceResponse.dart';


class  SimilarItem extends StatefulWidget {
 Results results ;
 SimilarItem({required this.results});
  @override
  State<SimilarItem> createState() => _SimilarItemState();
}

class _SimilarItemState extends State<SimilarItem> {
bool  select=true;

@override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(

          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child:  CachedNetworkImage(
                    width: MediaQuery.of(context).size.width * 0.22,
                    imageUrl:
                    "${ApiConst.imageBaseURL}w92${widget.results.posterPath}",
                    placeholder: (context, url) => CircularProgressIndicator(
                      color: MyTheme.yellow,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      select = !select;
                    });

                    var film = MyMovie(
                      id: widget.results.id.toString(),
                      titel: widget.results.title ?? '',
                      dateTime: widget.results.releaseDate ?? '',
                      images: widget.results.posterPath ?? '',
                      ratingImages:
                      widget.results.voteAverage?.toString() ?? '0.0',
                    );
                    FireBaseUtils.addMovie(film);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.06,
                    child: Image.asset(
                      select
                          ? 'assets/images/bookmark.png'
                          : 'assets/images/bookmark_selected.png',
                    ),
                  ),
                ),
              ],

            ),
            Row(
              children: [
                Image.asset('assets/images/rating.png',
                  height: MediaQuery.of(context).size.height*0.03,
                  width: MediaQuery.of(context).size.width*0.09,
                ),
                Text(widget.results.voteCount.toString(),
                  style: Theme.of(context).textTheme.titleSmall,

                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.22,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  widget.results.title ?? "",
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],

        )

      ],
    );;
  }
}
