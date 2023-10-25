import 'package:flutter/material.dart';
import 'package:flutter_challenge/i18n/translations.dart';
import 'package:lottie/lottie.dart';

import '../../../../resources/res.dart';

///GenericError servers as a general purpose widget for retrying a failed request via the [retry] method, and a custom [text] if needed
class GenericError extends StatelessWidget {
  final Function()? retry;
  final String? text;

  const GenericError({super.key, this.text, this.retry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Lottie.asset(
          LottieFiles.error,
          width: Sizes.errorLottieSize,
          height: Sizes.errorLottieSize,
        ),
        const SizedBox(
          height: Sizes.paddingM,
        ),
        Text(
          text ?? translation.notFoundPage.somethingWentWrong,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        if (retry != null)
          const SizedBox(
            height: Sizes.padding,
          ),
        if (retry != null)
          Center(
            child: ElevatedButton(
              onPressed: retry,
              child: Text(
                translation.notFoundPage.retry,
              ),
            ),
          )
      ],
    );
  }
}
