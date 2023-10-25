import 'package:json_annotation/json_annotation.dart';

part 'images_response.g.dart';

///Response for /images/all or /images/random
///[images] contains a list of image urls
///[status] can be either success or error
@JsonSerializable()
class ImagesResponse {
  @JsonKey(name: 'message')
  final List<String> images;
  final String status;

  ImagesResponse(this.images, this.status);

  factory ImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ImagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesResponseToJson(this);
}
