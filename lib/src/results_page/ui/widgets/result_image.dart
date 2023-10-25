import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/base/widget/loader.dart';

import '../../../../resources/res.dart';

///Display the [image] with a simple loader and error handling
class ResultImage extends StatelessWidget {
  final String image;

  const ResultImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(
          Sizes.borderRadiusS,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        image,
        loadingBuilder: (context, child, event) => event == null
            ? child
            : const Center(
                child: Loader(),
              ),
        errorBuilder: (context, child, event) => const Center(
          child: Icon(
            Icons.error_outline_rounded,
          ),
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
