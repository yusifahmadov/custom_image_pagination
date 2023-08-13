import 'package:imageproject/features/photo/domain/entities/photo_url.dart';
import 'package:json_annotation/json_annotation.dart';
part 'photo_url_model.g.dart';

@JsonSerializable()
class PhotoUrlModel extends PhotoUrl {
  const PhotoUrlModel(
      {required super.full,
      required super.raw,
      required super.small,
      required super.thumb});

  factory PhotoUrlModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoUrlModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoUrlModelToJson(this);
}
