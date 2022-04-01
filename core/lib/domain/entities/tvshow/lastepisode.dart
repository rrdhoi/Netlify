import 'package:equatable/equatable.dart';

class LastEpisodeToAir extends Equatable {
  LastEpisodeToAir({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episodeNumber,
    required this.seasonNumber,
    required this.stillPath,
  });

  final int id;
  final String name;
  final DateTime airDate;
  final int? episodeNumber;

  final int? seasonNumber;
  final String? stillPath;

  @override
  List<Object?> get props =>
      [id, name, airDate, episodeNumber, seasonNumber, stillPath];
}
