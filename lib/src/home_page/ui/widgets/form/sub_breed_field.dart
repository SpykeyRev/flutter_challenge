import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/home_page/di/home_page_providers.dart';
import 'package:flutter_challenge/src/home_page/ui/viewmodel/home_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slang/builder/utils/string_extensions.dart';

import '../../../../../i18n/translations.dart';
import '../../../../../resources/res.dart';
import '../../../../base/widget/custom_dropdown_field.dart';

class SubBreedField extends ConsumerWidget {
  const SubBreedField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomePageViewModel viewModel = ref.watch(homePageViewModelProvider);
    if (viewModel.subBreeds.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(translation.homePage.subBreed),
        const SizedBox(
          height: Sizes.paddingXS,
        ),
        CustomDropDownFormField<String?>(
          enableCancel: true,
          onChanged: (val) => viewModel.selectedSubBreed = val,
          hintText: translation.homePage.hintSubBreed,
          items: viewModel.subBreeds
              .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e.capitalize()),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
