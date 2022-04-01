import 'dart:io';

import 'package:dartz/dartz.dart';


import '../../domain/entities/tvshow/tvshow.dart';
import '../../domain/entities/tvshow/tvshow_detail.dart';
import '../../domain/repositories/tvshow_repository.dart';
import '../../utils/exception.dart';
import '../../utils/failure.dart';
import '../datasources/tvshow/tvshow_local_data_source.dart';
import '../datasources/tvshow/tvshow_remote_data_source.dart';
import '../models/tvshow/tv_table.dart';

class TvShowRepositoryImpl implements TvShowRepository {
  final TvShowRemoteDataSource tvShowRemoteDataSource;
  final TvShowLocalDataSource tvShowLocalDataSource;

  TvShowRepositoryImpl({
    required this.tvShowRemoteDataSource,
    required this.tvShowLocalDataSource,
  });

  @override
  Future<Either<Failure, List<TvShow>>> getPopularTvShows() async {
    try {
      final result = await tvShowRemoteDataSource.getPopularTvShow();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getTopRatedTvShows() async {
    try {
      final result = await tvShowRemoteDataSource.getTopRatedTvShow();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TvShowDetail>> getTvShowDetail(int id) async {
    try {
      final result = await tvShowRemoteDataSource.getTvShowDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getTvShowRecommendations(int id) async {
    try {
      final result = await tvShowRemoteDataSource.getTvShowRecommendations(id);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getWatchlistTvShows() async {
    final result = await tvShowLocalDataSource.getWatchlistTvShow();
    return Right(result.map((data) => data.toEntity()).toList());
  }

  @override
  Future<bool> isAddedToWatchlist(int id) async {
    final result = await tvShowLocalDataSource.getTvShowById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, String>> removeWatchlist(
      TvShowDetail tvShowDetail) async {
    try {
      final result = await tvShowLocalDataSource
          .removeWatchlist(TvShowTable.fromEntity(tvShowDetail));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlist(
      TvShowDetail tvShowDetail) async {
    try {
      final result = await tvShowLocalDataSource
          .insertWatchlist(TvShowTable.fromEntity(tvShowDetail));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> searchTvShows(String query) async {
    try {
      final result = await tvShowRemoteDataSource.searchTvShows(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getOnTheAirTvShow() async {
    try {
      final result = await tvShowRemoteDataSource.getOnTheAirTvShow();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
