import '../../base/network/base_sealed_class.dart';
import '../data/model/breed_response.dart';

abstract class HomePageRepository {
  ///Fetches the breeds
  Future<Result<BreedResponse, Exception>> fetchBreeds();
}
