import 'package:equatable/equatable.dart';

class PhotoUrl extends Equatable {
  final String raw;
  final String full;
  final String small;
  final String thumb;

  const PhotoUrl(
      {required this.full,
      required this.raw,
      required this.small,
      required this.thumb});

  @override
  List<Object?> get props => [full, raw, small, thumb];
}
