import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';
import '../entities/tvshow/tvshow.dart';
import '../entities/tvshow/tvshow_detail.dart';

abstract class TvShowRepository {
  Future<Either<Failure, List<TvShow>>> getOnTheAirTvShow();

  Future<Either<Failure, List<TvShow>>> getPopularTvShows();

  Future<Either<Failure, List<TvShow>>> getTopRatedTvShows();

  Future<Either<Failure, TvShowDetail>> getTvShowDetail(int id);

  Future<Either<Failure, List<TvShow>>> getTvShowRecommendations(int id);

  Future<Either<Failure, List<TvShow>>> searchTvShows(String query);

  Future<Either<Failure, String>> saveWatchlist(TvShowDetail tvShowDetail);

  Future<Either<Failure, String>> removeWatchlist(TvShowDetail tvShowDetail);

  Future<bool> isAddedToWatchlist(int id);

  Future<Either<Failure, List<TvShow>>> getWatchlistTvShows();
}
