import 'package:json_annotation/json_annotation.dart';

part 'breed_response.g.dart';

///Response for /breeds/list/all
///[breeds] contains for each key (breed) a List of sub-breed
///[status] can be either success or error
@JsonSerializable()
class BreedResponse {
  @JsonKey(name: 'message')
  final Map<String, List<String>> breeds;
  final String status;

  BreedResponse(this.breeds, this.status);

  factory BreedResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BreedResponseToJson(this);
}
