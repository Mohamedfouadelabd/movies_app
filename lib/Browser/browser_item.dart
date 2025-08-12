import 'package:flutter/material.dart';
import 'package:movies_app/Browser/movies_discover_screen.dart';

import '../model/Response/MoveListSourceResponse.dart';

class BrowserItem extends StatelessWidget {
  Genres genres;
  BrowserItem({required this.genres});

  @override
  Widget build(BuildContext context) {
    return InkWell(
onTap: (){
  Navigator.of(context).pushNamed(MovieDiscoverScreen.routeName,
  arguments: genres,

  );

},

      child: Stack(
        children: [
                ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/Mask Group 2.png',

              width: double.infinity,
              height: double.infinity,
            ),
          ),


          Center(
            child: Text(
              genres.name??"",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(0, 1),
                    blurRadius: 4,
                    color: Colors.black54,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );

  }
}
