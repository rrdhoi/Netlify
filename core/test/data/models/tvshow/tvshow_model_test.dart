import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTvShowModel = TvShowModel(
    backdropPath: 'backdropPath',
    genreIds: [1, 2],
    id: 1,
    name: 'name',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 7.8,
    posterPath: 'posterPath',
    originalLanguage: 'originalLanguage',
    originCountry: ['originCountry'],
    voteAverage: 7.8,
    voteCount: 7,
  );

  final tTvShow = TvShow(
    backdropPath: 'backdropPath',
    genreIds: [1, 2],
    id: 1,
    name: 'name',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 7.8,
    posterPath: 'posterPath',
    voteAverage: 7.8,
    voteCount: 7,
  );

  test('should be a subclass of TvShow Entity', () async {
    final result = tTvShowModel.toEntity();
    expect(tTvShow, result);
  });
}
