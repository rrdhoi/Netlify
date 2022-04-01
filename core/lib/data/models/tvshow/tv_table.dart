import 'package:equatable/equatable.dart';

import '../../../domain/entities/tvshow/tvshow.dart';
import '../../../domain/entities/tvshow/tvshow_detail.dart';

class TvShowTable extends Equatable {
  final int id;
  final String? name;
  final String? overview;
  final String? posterPath;

  TvShowTable({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
  });

  factory TvShowTable.fromEntity(TvShowDetail movie) => TvShowTable(
        id: movie.id,
        name: movie.name,
        overview: movie.overview,
        posterPath: movie.posterPath,
      );

  factory TvShowTable.fromMap(Map<String, dynamic> map) => TvShowTable(
        id: map['id'],
        name: map['name'],
        overview: map['overview'],
        posterPath: map['posterPath'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'overview': overview,
        'posterPath': posterPath,
      };

  TvShow toEntity() => TvShow.watchlist(
        id: id,
        name: name,
        overview: overview,
        posterPath: posterPath,
      );

  @override
  List<Object?> get props => [id, name, posterPath, overview];
}
