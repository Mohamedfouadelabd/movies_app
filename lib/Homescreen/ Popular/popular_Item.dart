import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Api/api-const.dart';
import 'package:movies_app/Firebase/FirebaseUtils/firebase_utils.dart';
import 'package:movies_app/Firebase/my_movie.dart';

import 'package:movies_app/Homescreen/home_screen_detils.dart';
import 'package:movies_app/Theme/my_theme.dart';

import '../../model/Response/PopularSourceResponse.dart';

class PopularItem extends StatefulWidget {
  Results results;

  PopularItem({required this.results});
  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  bool select = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          HomeScreenDetils.routeName,
          arguments: widget.results,
        );
      },
      child: Container(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
                  '${ApiConst.imageBaseURL}w500${widget.results.posterPath}',
              placeholder: (context, url) => CircularProgressIndicator(
                color: MyTheme.yellow,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: CachedNetworkImage(
                    imageUrl:
                        '${ApiConst.imageBaseURL}w500${widget.results.posterPath}',
                    placeholder: (context, url) => CircularProgressIndicator(
                      color: MyTheme.yellow,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      widget.results.title ?? '',
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
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
                  ratingImages: widget.results.voteAverage?.toString() ?? '0.0',
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
