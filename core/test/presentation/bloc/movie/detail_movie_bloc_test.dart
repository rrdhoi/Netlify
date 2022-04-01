import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'detail_movie_bloc_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
])
void main() {
  late DetailMovieBloc detailMovieBloc;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetMovieDetail mockGetMovieDetail;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    detailMovieBloc =
        DetailMovieBloc(mockGetMovieDetail, mockGetMovieRecommendations);
  });

  final tDetailMovie = testMovieDetail;
  final tListMovie = testMovieList;
  const tId = 0;

  test('initial state should be empty', () {
    expect(detailMovieBloc.state, DetailMovieEmpty());
  });

  blocTest<DetailMovieBloc, DetailMovieState>(
      'Should emit [Loading, Error] when get MovieDetailDetail is unsuccessful',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return detailMovieBloc;
      },
      act: (bloc) => bloc.add(FetchDetailMovie(tId)),
      expect: () => [
            DetailMovieLoading(),
            DetailMovieError('Server Failure'),
          ],
      verify: (bloc) {
        verify(mockGetMovieDetail.execute(tId));
      });

  blocTest<DetailMovieBloc, DetailMovieState>(
      'Should emit [Loading, Error] when get MovieRecommendations is unsuccessful',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => Right(tDetailMovie));
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return detailMovieBloc;
      },
      act: (bloc) => bloc.add(FetchDetailMovie(tId)),
      expect: () => [
            DetailMovieLoading(),
            DetailMovieError('Server Failure'),
          ],
      verify: (bloc) {
        verify(mockGetMovieDetail.execute(tId));
        verify(mockGetMovieRecommendations.execute(tId));
      });

  blocTest<DetailMovieBloc, DetailMovieState>(
      'Should emit [Loading, HasData] when get MovieRecommendations and DetailMovie is successful',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => Right(tDetailMovie));
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Right(tListMovie));
        return detailMovieBloc;
      },
      act: (bloc) => bloc.add(FetchDetailMovie(tId)),
      expect: () =>
          [DetailMovieLoading(), DetailMovieHasData(tDetailMovie, tListMovie)],
      verify: (bloc) {
        verify(mockGetMovieDetail.execute(tId));
        verify(mockGetMovieRecommendations.execute(tId));
      });
}
