import 'package:equatable/equatable.dart';
import 'package:imageproject/features/photo/data/models/user_model.dart';

import '../../data/models/photo_url_model.dart';

class Photo extends Equatable {
  final String id;
  final PhotoUrlModel urls;
  final UserModel user;

  const Photo({required this.id, required this.urls, required this.user});

  @override
  List<Object?> get props => [id, urls, user];
}
