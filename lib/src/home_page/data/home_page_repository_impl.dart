import '../../base/network/base_sealed_class.dart';
import '../domain/home_page_repository.dart';
import 'model/breed_response.dart';
import 'source/home_page_data_source.dart';

class HomePageRepositoryImpl extends HomePageRepository {
  final HomePageDataSource _homePageRemoteDataSource;

  HomePageRepositoryImpl(this._homePageRemoteDataSource);

  @override
  Future<Result<BreedResponse, Exception>> fetchBreeds() =>
      _homePageRemoteDataSource.fetchBreeds();
}
