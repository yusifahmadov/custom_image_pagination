import 'package:equatable/equatable.dart';
import 'package:imageproject/core/error/response.dart';

import '../../domain/entities/photo.dart';

class PhotoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PhotoInitial extends PhotoState {}

class PhotoDataLoading extends PhotoState {
  final List<Photo> data;
  PhotoDataLoading({required this.data});
}

class PhotoDataFailed extends PhotoState {
  final ResponseI data;
  PhotoDataFailed({required this.data});
}

class PhotoDataLoaded extends PhotoState {
  final List<Photo> data;
  PhotoDataLoaded({required this.data});
}

class OnePhotoDataLoading extends PhotoState {}

class OnePhotoDataFailed extends PhotoState {
  final ResponseI data;
  OnePhotoDataFailed({required this.data});
}

class OnePhotoDataLoaded extends PhotoState {
  final Photo data;
  OnePhotoDataLoaded({required this.data});
}
