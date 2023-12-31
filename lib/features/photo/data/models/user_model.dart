import 'package:imageproject/features/photo/data/models/profile_image_model.dart';
import 'package:imageproject/features/photo/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel(
      {required super.id, required super.name, required super.profileImage});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
