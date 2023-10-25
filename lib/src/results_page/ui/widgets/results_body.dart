import 'package:flutter/material.dart';
import 'package:flutter_challenge/i18n/translations.dart';
import 'package:flutter_challenge/src/base/widget/generic_error.dart';
import 'package:flutter_challenge/src/results_page/ui/widgets/result_image.dart';

import '../../../../resources/res.dart';

//Main view of ResultsPage in case of success
class ResultsBody extends StatelessWidget {
  final List<String> images;

  const ResultsBody({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    //If request is correct but no images available
    if (images.isEmpty) {
      return GenericError(
        text: translation.resultsPage.noResults,
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.all(Sizes.padding),
      itemCount: images.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: Sizes.padding,
        mainAxisSpacing: Sizes.padding,
        childAspectRatio: 1,
        crossAxisCount: images.length > 10 ? 2 : 1,
      ),
      //Cache extent is made to the height of the screen for minimizing loading pops (Since is a builder we only take x images at the time for avoiding excessive memory usage)
      cacheExtent: MediaQuery.of(context).size.height,
      itemBuilder: (context, index) => ResultImage(
        image: images[index],
      ),
    );
  }
}
