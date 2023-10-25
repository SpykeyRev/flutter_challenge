import '../../base/network/base_sealed_class.dart';
import '../domain/results_page_repository.dart';
import '../ui/model/results_page_model.dart';
import 'model/images_response.dart';
import 'source/results_page_data_source.dart';

class ResultsPageRepositoryImpl extends ResultsPageRepository {
  final ResultsPageDataSource _resultsPageRemoteDataSource;

  ResultsPageRepositoryImpl(this._resultsPageRemoteDataSource);

  @override
  Future<Result<ImagesResponse, Exception>> fetchImages(
          ResultsPageModel model) =>
      model.random
          ? _resultsPageRemoteDataSource.fetchRandomImage(model)
          : _resultsPageRemoteDataSource.fetchAllImages(model);
}
