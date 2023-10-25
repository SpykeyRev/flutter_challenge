import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/home_page/di/home_page_providers.dart';
import 'package:flutter_challenge/src/home_page/ui/viewmodel/home_page_view_model.dart';
import 'package:flutter_challenge/src/home_page/ui/widgets/form/breed_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../i18n/translations.dart';
import '../../../../resources/res.dart';
import '../../../base/routing/routes.dart';
import '../../../results_page/ui/model/results_page_model.dart';
import 'form/sub_breed_field.dart';

///Main view of the HomePage
class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomePageViewModel viewModel = ref.read(homePageViewModelProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding,
      ),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: viewModel.formKey,
        child: Column(
          children: [
            Text(
              translation.homePage.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: Sizes.padding,
            ),
            const BreedField(),
            const SizedBox(
              height: Sizes.padding,
            ),
            const SubBreedField(),
            const SizedBox(
              height: Sizes.padding,
            ),
            ElevatedButton(
                onPressed: () {
                  bool valid =
                      viewModel.formKey.currentState?.validate() ?? false;
                  if (valid) {
                    GoRouter.of(context).goNamed(
                      AppRoute.resultsPage.name,
                      queryParameters: ResultsPageModel(
                        breed: viewModel.selectedBreed!,
                        subBreed: viewModel.selectedSubBreed,
                        random: true,
                      ).toJson(),
                    );
                  }
                },
                child: Text(translation.homePage.getRandomImage)),
            const SizedBox(
              height: Sizes.padding,
            ),
            ElevatedButton(
                onPressed: () {
                  //Validate the form and push page
                  bool valid =
                      viewModel.formKey.currentState?.validate() ?? false;
                  if (valid) {
                    GoRouter.of(context).goNamed(
                      AppRoute.resultsPage.name,
                      queryParameters: ResultsPageModel(
                        breed: viewModel.selectedBreed!,
                        subBreed: viewModel.selectedSubBreed,
                        random: false,
                      ).toJson(),
                    );
                  }
                },
                child: Text(translation.homePage.getAllImages)),
          ],
        ),
      ),
    );
  }
}
