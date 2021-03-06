// Mocks generated by Mockito 5.1.0 from annotations
// in core/test/helpers/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:convert' as _i13;
import 'dart:typed_data' as _i14;

import 'package:core/core.dart' as _i4;
import 'package:core/data/datasources/db/database_helper.dart' as _i11;
import 'package:core/data/models/movie_detail_model.dart' as _i3;
import 'package:core/data/models/movie_model.dart' as _i10;
import 'package:core/domain/entities/movie.dart' as _i8;
import 'package:core/domain/entities/movie_detail.dart' as _i9;
import 'package:core/utils/failure.dart' as _i7;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i12;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeMovieDetailResponse_1 extends _i1.Fake
    implements _i3.MovieDetailResponse {}

class _FakeTvShowDetailResponse_2 extends _i1.Fake
    implements _i4.TvShowDetailResponse {}

class _FakeResponse_3 extends _i1.Fake implements _i5.Response {}

class _FakeStreamedResponse_4 extends _i1.Fake implements _i5.StreamedResponse {
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i4.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingMovies, []),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
              _FakeEither_0<_i7.Failure, List<_i8.Movie>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(Invocation.method(#getPopularMovies, []),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
              _FakeEither_0<_i7.Failure, List<_i8.Movie>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
              _FakeEither_0<_i7.Failure, List<_i8.Movie>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
          returnValue: Future<_i2.Either<_i7.Failure, _i9.MovieDetail>>.value(
              _FakeEither_0<_i7.Failure, _i9.MovieDetail>())) as _i6
          .Future<_i2.Either<_i7.Failure, _i9.MovieDetail>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> getMovieRecommendations(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
              _FakeEither_0<_i7.Failure, List<_i8.Movie>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
              _FakeEither_0<_i7.Failure, List<_i8.Movie>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> saveWatchlist(
          _i9.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [movie]),
              returnValue: Future<_i2.Either<_i7.Failure, String>>.value(
                  _FakeEither_0<_i7.Failure, String>()))
          as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> removeWatchlist(
          _i9.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
              returnValue: Future<_i2.Either<_i7.Failure, String>>.value(
                  _FakeEither_0<_i7.Failure, String>()))
          as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
              _FakeEither_0<_i7.Failure, List<_i8.Movie>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i4.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i10.MovieModel>> getNowPlayingMovies() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingMovies, []),
              returnValue:
                  Future<List<_i10.MovieModel>>.value(<_i10.MovieModel>[]))
          as _i6.Future<List<_i10.MovieModel>>);
  @override
  _i6.Future<List<_i10.MovieModel>> getPopularMovies() => (super.noSuchMethod(
          Invocation.method(#getPopularMovies, []),
          returnValue: Future<List<_i10.MovieModel>>.value(<_i10.MovieModel>[]))
      as _i6.Future<List<_i10.MovieModel>>);
  @override
  _i6.Future<List<_i10.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
          Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<List<_i10.MovieModel>>.value(<_i10.MovieModel>[]))
      as _i6.Future<List<_i10.MovieModel>>);
  @override
  _i6.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
              returnValue: Future<_i3.MovieDetailResponse>.value(
                  _FakeMovieDetailResponse_1()))
          as _i6.Future<_i3.MovieDetailResponse>);
  @override
  _i6.Future<List<_i10.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
              returnValue:
                  Future<List<_i10.MovieModel>>.value(<_i10.MovieModel>[]))
          as _i6.Future<List<_i10.MovieModel>>);
  @override
  _i6.Future<List<_i10.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
              returnValue:
                  Future<List<_i10.MovieModel>>.value(<_i10.MovieModel>[]))
          as _i6.Future<List<_i10.MovieModel>>);
}

/// A class which mocks [MovieLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieLocalDataSource extends _i1.Mock
    implements _i4.MovieLocalDataSource {
  MockMovieLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchlist(_i4.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<String> removeWatchlist(_i4.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i4.MovieTable?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<_i4.MovieTable?>.value())
          as _i6.Future<_i4.MovieTable?>);
  @override
  _i6.Future<List<_i4.MovieTable>> getWatchlistMovies() => (super.noSuchMethod(
          Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<List<_i4.MovieTable>>.value(<_i4.MovieTable>[]))
      as _i6.Future<List<_i4.MovieTable>>);
}

/// A class which mocks [TvShowRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvShowRepository extends _i1.Mock implements _i4.TvShowRepository {
  MockTvShowRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>> getOnTheAirTvShow() =>
      (super.noSuchMethod(Invocation.method(#getOnTheAirTvShow, []),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>>.value(
              _FakeEither_0<_i7.Failure, List<_i4.TvShow>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>> getPopularTvShows() =>
      (super.noSuchMethod(Invocation.method(#getPopularTvShows, []),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>>.value(
              _FakeEither_0<_i7.Failure, List<_i4.TvShow>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>> getTopRatedTvShows() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTvShows, []),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>>.value(
              _FakeEither_0<_i7.Failure, List<_i4.TvShow>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i4.TvShowDetail>> getTvShowDetail(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvShowDetail, [id]),
          returnValue: Future<_i2.Either<_i7.Failure, _i4.TvShowDetail>>.value(
              _FakeEither_0<_i7.Failure, _i4.TvShowDetail>())) as _i6
          .Future<_i2.Either<_i7.Failure, _i4.TvShowDetail>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>>
      getTvShowRecommendations(int? id) => (super.noSuchMethod(
          Invocation.method(#getTvShowRecommendations, [id]),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>>.value(
              _FakeEither_0<_i7.Failure, List<_i4.TvShow>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>> searchTvShows(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTvShows, [query]),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>>.value(
              _FakeEither_0<_i7.Failure, List<_i4.TvShow>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> saveWatchlist(
          _i4.TvShowDetail? tvShowDetail) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [tvShowDetail]),
              returnValue: Future<_i2.Either<_i7.Failure, String>>.value(
                  _FakeEither_0<_i7.Failure, String>()))
          as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> removeWatchlist(
          _i4.TvShowDetail? tvShowDetail) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [tvShowDetail]),
              returnValue: Future<_i2.Either<_i7.Failure, String>>.value(
                  _FakeEither_0<_i7.Failure, String>()))
          as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>> getWatchlistTvShows() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTvShows, []),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>>.value(
              _FakeEither_0<_i7.Failure, List<_i4.TvShow>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i4.TvShow>>>);
}

/// A class which mocks [TvShowRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvShowRemoteDataSource extends _i1.Mock
    implements _i4.TvShowRemoteDataSource {
  MockTvShowRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i4.TvShowModel>> getOnTheAirTvShow() => (super.noSuchMethod(
          Invocation.method(#getOnTheAirTvShow, []),
          returnValue: Future<List<_i4.TvShowModel>>.value(<_i4.TvShowModel>[]))
      as _i6.Future<List<_i4.TvShowModel>>);
  @override
  _i6.Future<List<_i4.TvShowModel>> getPopularTvShow() => (super.noSuchMethod(
          Invocation.method(#getPopularTvShow, []),
          returnValue: Future<List<_i4.TvShowModel>>.value(<_i4.TvShowModel>[]))
      as _i6.Future<List<_i4.TvShowModel>>);
  @override
  _i6.Future<List<_i4.TvShowModel>> getTopRatedTvShow() => (super.noSuchMethod(
          Invocation.method(#getTopRatedTvShow, []),
          returnValue: Future<List<_i4.TvShowModel>>.value(<_i4.TvShowModel>[]))
      as _i6.Future<List<_i4.TvShowModel>>);
  @override
  _i6.Future<_i4.TvShowDetailResponse> getTvShowDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvShowDetail, [id]),
              returnValue: Future<_i4.TvShowDetailResponse>.value(
                  _FakeTvShowDetailResponse_2()))
          as _i6.Future<_i4.TvShowDetailResponse>);
  @override
  _i6.Future<List<_i4.TvShowModel>> getTvShowRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvShowRecommendations, [id]),
              returnValue:
                  Future<List<_i4.TvShowModel>>.value(<_i4.TvShowModel>[]))
          as _i6.Future<List<_i4.TvShowModel>>);
  @override
  _i6.Future<List<_i4.TvShowModel>> searchTvShows(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTvShows, [query]),
              returnValue:
                  Future<List<_i4.TvShowModel>>.value(<_i4.TvShowModel>[]))
          as _i6.Future<List<_i4.TvShowModel>>);
}

/// A class which mocks [TvShowLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvShowLocalDataSource extends _i1.Mock
    implements _i4.TvShowLocalDataSource {
  MockTvShowLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchlist(_i4.TvShowTable? tvShow) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [tvShow]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<String> removeWatchlist(_i4.TvShowTable? tvShow) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [tvShow]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i4.TvShowTable?> getTvShowById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvShowById, [id]),
              returnValue: Future<_i4.TvShowTable?>.value())
          as _i6.Future<_i4.TvShowTable?>);
  @override
  _i6.Future<List<_i4.TvShowTable>> getWatchlistTvShow() => (super.noSuchMethod(
          Invocation.method(#getWatchlistTvShow, []),
          returnValue: Future<List<_i4.TvShowTable>>.value(<_i4.TvShowTable>[]))
      as _i6.Future<List<_i4.TvShowTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i11.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i12.Database?> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<_i12.Database?>.value())
          as _i6.Future<_i12.Database?>);
  @override
  _i6.Future<int> insertWatchlistMovie(_i4.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistMovie, [movie]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlistMovie(_i4.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistMovie, [movie]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i6.Future<List<Map<String, dynamic>>>);
  @override
  _i6.Future<int> insertWatchlistTvShow(_i4.TvShowTable? tvShow) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTvShow, [tvShow]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlistTvShow(_i4.TvShowTable? tvShow) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTvShow, [tvShow]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getTvShowById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvShowById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistTvShows() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTvShows, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i6.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i5.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i5.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i6.Future<_i5.Response>);
  @override
  _i6.Future<_i5.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i6.Future<_i5.Response>);
  @override
  _i6.Future<_i5.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i13.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i6.Future<_i5.Response>);
  @override
  _i6.Future<_i5.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i13.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i6.Future<_i5.Response>);
  @override
  _i6.Future<_i5.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i13.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i6.Future<_i5.Response>);
  @override
  _i6.Future<_i5.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i13.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i6.Future<_i5.Response>);
  @override
  _i6.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i14.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i14.Uint8List>.value(_i14.Uint8List(0)))
          as _i6.Future<_i14.Uint8List>);
  @override
  _i6.Future<_i5.StreamedResponse> send(_i5.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i5.StreamedResponse>.value(_FakeStreamedResponse_4()))
          as _i6.Future<_i5.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
