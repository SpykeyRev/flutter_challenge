import '../../../base/network/base_sealed_class.dart';
import '../model/breed_response.dart';

abstract class HomePageDataSource {
  Future<Result<BreedResponse, Exception>> fetchBreeds();
}
