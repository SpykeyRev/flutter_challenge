import '../../base/network/base_sealed_class.dart';
import '../data/model/images_response.dart';
import '../ui/model/results_page_model.dart';

abstract class ResultsPageRepository {
  ///Fetches images based on the [model] provided
  ///
  /// if [model.random] we expect to retrieve one image, if not, one or more
  Future<Result<ImagesResponse, Exception>> fetchImages(ResultsPageModel model);
}
