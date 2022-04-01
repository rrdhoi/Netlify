import 'package:core/domain/entities/tvshow/season.dart';
import 'package:equatable/equatable.dart';

import '../genre.dart';
import 'lastepisode.dart';

class TvShowDetail extends Equatable {
  TvShowDetail({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.lastEpisode,
    required this.seasons,
    required this.id,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.status,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String? backdropPath;
  final List<Genre> genres;
  final LastEpisodeToAir lastEpisode;
  final List<Season> seasons;
  final int id;
  final String originalName;
  final String overview;
  final String? posterPath;
  final String status;
  final String name;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genres,
        lastEpisode,
        seasons,
        id,
        originalName,
        overview,
        posterPath,
        status,
        name,
        voteAverage,
        voteCount,
      ];
}
