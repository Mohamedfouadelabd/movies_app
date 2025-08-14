

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String name;
  CustomText({required this.name});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(name,
      style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
