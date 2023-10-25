import 'package:dio/dio.dart';
import 'package:flutter_challenge/src/results_page/data/model/images_response.dart';
import 'package:flutter_challenge/src/results_page/ui/model/results_page_model.dart';

import '../../../base/network/base_sealed_class.dart';
import 'results_page_data_source.dart';

class ResultsPageDataSourceImpl extends ResultsPageDataSource {
  final Dio _dio;

  ResultsPageDataSourceImpl(this._dio);

  @override
  Future<Result<ImagesResponse, Exception>> fetchRandomImage(
      ResultsPageModel model) async {
    try {
      Response response = await _dio.get(
          "/breed/${model.breed}${model.subBreed != null ? "/${model.subBreed}" : ""}/images/random/1");
      return Success(
        ImagesResponse.fromJson(
          response.data,
        ),
      );
    } on DioException catch (e) {
      return Failure(null, e);
    } on Exception catch (e) {
      return Failure(null, e);
    }
  }

  @override
  Future<Result<ImagesResponse, Exception>> fetchAllImages(
      ResultsPageModel model) async {
    try {
      Response response = await _dio.get(
          "/breed/${model.breed}${model.subBreed != null ? "/${model.subBreed}" : ""}/images");
      return Success(
        ImagesResponse.fromJson(
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

class Base {}
