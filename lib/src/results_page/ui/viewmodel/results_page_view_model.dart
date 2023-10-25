import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/results_page/ui/model/results_page_model.dart';
import '../../../base/network/base_sealed_class.dart';
import '../../data/model/images_response.dart';
import '../../domain/results_page_repository.dart';

class ResultsPageViewModel extends ChangeNotifier {
  late ResultsPageRepository resultsPageRepository;

  ResultsPageViewModel(
    this.resultsPageRepository,
  );

  //Request model
  ResultsPageModel? requestModel;

  //Images response
  Result<ImagesResponse, Exception> images = const Loading();

  Future<void> fetchImages(ResultsPageModel model, {force = false}) async {
    //Only on first request or forced by retry
    if ((requestModel == null || force)) {
      //If old request is Failed we reset it to Loading
      if (force) {
        images = const Loading();
        //notifyListeners();
      }
      requestModel = model;
      images = await resultsPageRepository.fetchImages(model);
      notifyListeners();
    }
  }
}
