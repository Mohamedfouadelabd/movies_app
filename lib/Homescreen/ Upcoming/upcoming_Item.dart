import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Api/api-const.dart';
import 'package:movies_app/Theme/my_theme.dart';

import '../../model/Response/UpComingSourceResponse.dart';

class UpcomingItem extends StatefulWidget {
  Results results;
  UpcomingItem({required this.results});
  @override
  State<UpcomingItem> createState() => _UpcomingItemState();
}

class _UpcomingItemState extends State<UpcomingItem> {
  bool select = true;

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
                  child: CachedNetworkImage(
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
                  },
                  child: Image.asset(
                      select
                          ? 'assets/images/bookmark.png'
                          : 'assets/images/bookmark_selected.png',
                      width: MediaQuery.of(context).size.width * 0.09,
                      height: MediaQuery.of(context).size.height * 0.062),
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
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                widget.results.releaseDate ?? "",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        )
      ],
    );
  }
}
