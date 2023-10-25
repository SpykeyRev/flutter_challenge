import 'package:dio/dio.dart';

import '../../../base/network/base_sealed_class.dart';
import '../model/breed_response.dart';
import 'home_page_data_source.dart';

class HomePageDataSourceImpl extends HomePageDataSource {
  final Dio _dio;

  HomePageDataSourceImpl(this._dio);

  @override
  Future<Result<BreedResponse, Exception>> fetchBreeds() async {
    try {
      Response response = await _dio.get("/breeds/list/all");
      return Success(
        BreedResponse.fromJson(
          response.data,
        ),
      );
    } on DioException catch (e) {
      return Failure(null, e);
    } on Exception catch (e) {
      return Failure(null, e);
    }
  }
}
