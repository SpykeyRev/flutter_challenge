import 'package:flutter_challenge/src/base/network/base_sealed_class.dart';
import 'package:flutter_challenge/src/home_page/ui/widgets/home_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../../base/widget/generic_error.dart';
import '../../../base/widget/loader.dart';
import '../../../base/widget/paws_background.dart';
import '../../di/home_page_providers.dart';
import '../viewmodel/home_page_view_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomePageViewModel viewModel = ref.watch(homePageViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter Challenge 🐶"),
      ),
      body: Stack(
        children: [
          const PawsBackground(),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            child: switch (viewModel.breeds) {
              Success() => const HomeBody(),
              Failure() => GenericError(
                  retry: viewModel.fetchBreeds,
                ),
              Loading() => const Center(child: Loader()),
            },
          ),
        ],
      ),
    );
  }
}
