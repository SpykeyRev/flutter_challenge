import '../../../base/network/base_sealed_class.dart';
import '../../ui/model/results_page_model.dart';
import '../model/images_response.dart';

abstract class ResultsPageDataSource {
  ///Fetches a random image based on the [model] provided
  Future<Result<ImagesResponse, Exception>> fetchRandomImage(
      ResultsPageModel model);

  ///Fetches all the images based on the [model] provided
  Future<Result<ImagesResponse, Exception>> fetchAllImages(
      ResultsPageModel model);
}
