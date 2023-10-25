import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slang/builder/utils/string_extensions.dart';
import '../../../base/network/base_sealed_class.dart';
import '../../../base/widget/generic_error.dart';
import '../../../base/widget/loader.dart';
import '../../di/results_page_providers.dart';
import '../model/results_page_model.dart';
import '../viewmodel/results_page_view_model.dart';
import '../widgets/results_body.dart';

///Page that shows results based on [ResultsPageModel]
class ResultsPage extends ConsumerStatefulWidget {
  final ResultsPageModel model;

  const ResultsPage({
    required this.model,
    super.key,
  });

  @override
  ConsumerState<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends ConsumerState<ResultsPage> {
  @override
  void initState() {
    super.initState();
    //First fetch
    ref.read(resultsPageViewModelProvider).fetchImages(widget.model);
  }

  @override
  void didUpdateWidget(covariant ResultsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    //Force fetch if the page is updated
    if (oldWidget.model != widget.model) {
      ref
          .read(resultsPageViewModelProvider)
          .fetchImages(widget.model, force: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    ResultsPageViewModel viewModel = ref.watch(resultsPageViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${viewModel.requestModel!.breed.capitalize()}${viewModel.requestModel!.subBreed != null ? " ${viewModel.requestModel!.subBreed!.capitalize()}" : ""}",
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 150),
        child: switch (viewModel.images) {
          Success(value: final value) => ResultsBody(
              images: value.images,
            ),
          Failure() => GenericError(
              retry: () => viewModel.fetchImages(
                widget.model,
                force: true,
              ),
            ),
          Loading() => const Center(child: Loader()),
        },
      ),
    );
  }
}
