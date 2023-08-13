import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../data/models/profile_image_model.dart';

class User extends Equatable {
  final String id;
  final String name;
  @JsonKey(name: "profile_image")
  final ProfileImageModel profileImage;

  const User(
      {required this.id, required this.name, required this.profileImage});
  @override
  List<Object?> get props => [id, name, profileImage];
}
