// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_url_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoUrlModel _$PhotoUrlModelFromJson(Map<String, dynamic> json) =>
    PhotoUrlModel(
      full: json['full'] as String,
      raw: json['raw'] as String,
      small: json['small'] as String,
      thumb: json['thumb'] as String,
    );

Map<String, dynamic> _$PhotoUrlModelToJson(PhotoUrlModel instance) =>
    <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'small': instance.small,
      'thumb': instance.thumb,
    };
