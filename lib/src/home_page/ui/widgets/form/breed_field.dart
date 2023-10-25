import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/home_page/di/home_page_providers.dart';
import 'package:flutter_challenge/src/home_page/ui/viewmodel/home_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slang/builder/utils/string_extensions.dart';

import '../../../../../i18n/translations.dart';
import '../../../../../resources/res.dart';
import '../../../../base/widget/custom_dropdown_field.dart';

class BreedField extends ConsumerWidget {
  const BreedField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomePageViewModel viewModel = ref.watch(homePageViewModelProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(translation.homePage.breed),
        const SizedBox(
          height: Sizes.paddingXS,
        ),
        CustomDropDownFormField<String>(
          onChanged: (val) => viewModel.selectedBreed = val,
          validator: (val) =>
              val == null ? translation.forms.selectValue : null,
          hintText: translation.homePage.hintBreed,
          items: [DropdownMenuItem<String>(
            value: "Wrong breed",
            child: Text("Wrong breed"),
          )]+viewModel.storedBreeds.keys
              .map((e) => e)
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e.capitalize()),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
