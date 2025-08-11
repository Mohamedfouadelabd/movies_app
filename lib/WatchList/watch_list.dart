

import 'package:flutter/material.dart';
import 'package:movies_app/Theme/my_theme.dart';

class WatchList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
     SizedBox(
       height: MediaQuery.of(context).size.height*0.15,
     ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Watchlist',
          style: Theme.of(context).textTheme.titleLarge,

          ),
        ),
Container(
 width: double.infinity,
height: MediaQuery.of(context).size.height*0.17,

  child: Row(
    children: [
      Image.asset('assets/images/Mask Group 2.png'),
Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('999999',
        style: Theme.of(context).textTheme.titleMedium,

      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('999999',
        style: Theme.of(context).textTheme.titleMedium,

      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('999999',
        style: Theme.of(context).textTheme.titleMedium,

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
