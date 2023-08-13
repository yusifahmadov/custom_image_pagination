import 'package:imageproject/features/photo/data/models/photo_url_model.dart';
import 'package:imageproject/features/photo/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/photo.dart';
part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel extends Photo {
  const PhotoModel(
      {required super.id, required super.urls, required super.user});

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}
