import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class SearchTvShow {
  TvShowRepository repository;

  SearchTvShow(this.repository);

  Future<Either<Failure, List<TvShow>>> execute(String query) =>
      repository.searchTvShows(query);
}
