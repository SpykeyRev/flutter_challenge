import 'package:flutter/material.dart';
import '../../../base/network/base_sealed_class.dart';
import '../../data/model/breed_response.dart';
import '../../domain/home_page_repository.dart';

class HomePageViewModel extends ChangeNotifier {
  late HomePageRepository homePageRepository;

  HomePageViewModel(
    this.homePageRepository,
  ) {
    fetchBreeds();
  }

  //Form key used for the breed selection
  GlobalKey<FormState> formKey = GlobalKey();

  //Breeds response
  Result<BreedResponse, Exception> breeds = const Loading();

  //Fetch breeds method
  Future<void> fetchBreeds() async {
    breeds = await homePageRepository.fetchBreeds();
    //Handle responses
    switch (breeds) {
      case Success(value: final value):
        //We save the response value for further filtering (sub-breed list)
        storedBreeds = value.breeds;
        break;
      case Loading():
        break;
      case Failure():
        break;
    }
    notifyListeners();
  }

  //Stored response value
  Map<String, List<String>> storedBreeds = {};

  //Selected breed value,getter and setter
  String? _selectedBreed;

  String? get selectedBreed => _selectedBreed;

  set selectedBreed(String? value) {
    _selectedBreed = value;
    //If value is not null, we filter the available sub-breeds and notify changes
    if (value != null) {
      selectedSubBreed = null;
      notifyListeners();
      filterSubBreeds();
    }
  }

  void filterSubBreeds() {
    //If the breed is available in the stored ones, we get the available sub-breeds
    if (storedBreeds.containsKey(_selectedBreed)) {
      subBreeds = storedBreeds[_selectedBreed]!;
      notifyListeners();
    }
  }

  //Available sub-breeds
  List<String> subBreeds = [];

  //Selected sub-breed
  String? selectedSubBreed;
}
