import 'package:imageproject/features/photo/domain/entities/profile_image.dart';
import 'package:json_annotation/json_annotation.dart';
part 'profile_image_model.g.dart';

@JsonSerializable()
class ProfileImageModel extends ProfileImage {
  const ProfileImageModel(
      {required super.large, required super.medium, required super.small});

  factory ProfileImageModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileImageModelToJson(this);
}
