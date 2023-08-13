import 'package:equatable/equatable.dart';

class ProfileImage extends Equatable {
  final String small;
  final String medium;
  final String large;

  const ProfileImage(
      {required this.large, required this.medium, required this.small});
  @override
  List<Object?> get props => [large, small, medium];
}
