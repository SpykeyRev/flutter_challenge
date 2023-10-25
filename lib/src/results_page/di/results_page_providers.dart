import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../base/di/base_providers.dart';
import '../data/results_page_repository_impl.dart';
import '../data/source/results_page_data_source.dart';
import '../data/source/results_page_remote_date_source_impl.dart';
import '../domain/results_page_repository.dart';
import '../ui/viewmodel/results_page_view_model.dart';

//DataSource provider, it's where we get the real data
final _resultsPageSourceProvider = Provider<ResultsPageDataSource>(
  (ref) {
    Dio dio = ref.read(dioProvider);
    return ResultsPageDataSourceImpl(dio);
  },
);

//Repository provider, it's where we all the remote/local request available, in the implementation we point to the Data source for getting data
final _resultsPageRepositoryProvider = Provider<ResultsPageRepository>(
  (ref) {
    final ResultsPageDataSource dataSource =
        ref.read(_resultsPageSourceProvider);
    return ResultsPageRepositoryImpl(dataSource);
  },
);

///ResultsPageViewModel provider, this is the logic provider of the results page
final resultsPageViewModelProvider =
    ChangeNotifierProvider.autoDispose<ResultsPageViewModel>((ref) {
  ResultsPageRepository repository = ref.watch(_resultsPageRepositoryProvider);
  return ResultsPageViewModel(repository);
});
