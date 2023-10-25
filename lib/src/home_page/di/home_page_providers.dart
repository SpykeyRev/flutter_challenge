import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../base/di/base_providers.dart';
import '../data/home_page_repository_impl.dart';
import '../data/source/home_page_data_source.dart';
import '../data/source/home_page_remote_date_source_impl.dart';
import '../domain/home_page_repository.dart';
import '../ui/viewmodel/home_page_view_model.dart';

//DataSource provider, it's where we get the real data
final _homePageSourceProvider = Provider<HomePageDataSource>(
  (ref) {
    Dio dio = ref.read(dioProvider);
    return HomePageDataSourceImpl(dio);
  },
);

//Repository provider, it's where we all the remote/local request available, in the implementation we point to the Data source for getting data
final _homePageRepositoryProvider = Provider<HomePageRepository>(
  (ref) {
    final HomePageDataSource dataSource = ref.read(_homePageSourceProvider);
    return HomePageRepositoryImpl(dataSource);
  },
);

///HomePageViewModel provider, this is the logic provider of the home page
final homePageViewModelProvider =
    ChangeNotifierProvider<HomePageViewModel>((ref) {
  HomePageRepository repository = ref.watch(_homePageRepositoryProvider);
  return HomePageViewModel(repository);
});
