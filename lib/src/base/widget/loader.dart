import 'package:flutter/material.dart';

import '../../../resources/res.dart';

///General purpose loader
class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(width: Sizes.loaderSize, height: Sizes.loaderSize, child: CircularProgressIndicator()),
        Text(
          "🐾",
          style: TextStyle(fontSize: Sizes.loaderSize/2),
        ),
      ],
    );
  }
}
