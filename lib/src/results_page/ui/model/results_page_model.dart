///ResultsPageModel is used for passing and parsing data for the ResultsPage
///
///[breed] has to be non-null
///
///[subBreed] is optional
///
///[random] has to be non-null
//We couldn't use JsonSerializable for this because of the query-parameters Map<String,String> restriction.
//We could have used JsonSerializable in combination of jsonEncode() and jsonDecode(), but this is a cleaner way
class ResultsPageModel {
  final String breed;
  final String? subBreed;
  final bool random;

  ResultsPageModel({
    required this.breed,
    this.subBreed,
    this.random = false,
  });

  factory ResultsPageModel.fromJson(Map<String, String> json) {
    return ResultsPageModel(
      breed: json['breed']!,
      subBreed: json['subBreed'],
      random: bool.parse(json['random'] ?? "false"),
    );
  }

  Map<String, String> toJson() => {
        'breed': breed,
        'random': random.toString(),
      }..addAll(
          subBreed != null ? {'subBreed': subBreed!} : {},
        );
}
