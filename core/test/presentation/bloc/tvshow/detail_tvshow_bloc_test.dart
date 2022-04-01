import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'detail_tvshow_bloc_test.mocks.dart';

@GenerateMocks([
  GetTvShowDetail,
  GetTvShowRecommendations,
])
void main() {
  late DetailTvShowBloc detailTvShowBloc;
  late MockGetTvShowRecommendations mockGetTvShowRecommendations;
  late MockGetTvShowDetail mockGetTvShowDetail;

  setUp(() {
    mockGetTvShowDetail = MockGetTvShowDetail();
    mockGetTvShowRecommendations = MockGetTvShowRecommendations();
    detailTvShowBloc =
        DetailTvShowBloc(mockGetTvShowDetail, mockGetTvShowRecommendations);
  });

  final tDetailTvShow = testTvShowDetail;
  final tListTvShow = testTvShowList;
  const tId = 0;

  test('initial state should be empty', () {
    expect(detailTvShowBloc.state, DetailTvShowEmpty());
  });

  blocTest<DetailTvShowBloc, DetailTvShowState>(
      'Should emit [Loading, Error] when get TvShowDetail is unsuccessful',
      build: () {
        when(mockGetTvShowDetail.execute(tId))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        when(mockGetTvShowRecommendations.execute(tId))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return detailTvShowBloc;
      },
      act: (bloc) => bloc.add(FetchDetailTvShow(tId)),
      expect: () => [
            DetailTvShowLoading(),
            DetailTvShowError('Server Failure'),
          ],
      verify: (bloc) {
        verify(mockGetTvShowDetail.execute(tId));
      });

  blocTest<DetailTvShowBloc, DetailTvShowState>(
      'Should emit [Loading, Error] when get TvShowRecommendations is unsuccessful',
      build: () {
        when(mockGetTvShowDetail.execute(tId))
            .thenAnswer((_) async => Right(tDetailTvShow));
        when(mockGetTvShowRecommendations.execute(tId))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return detailTvShowBloc;
      },
      act: (bloc) => bloc.add(FetchDetailTvShow(tId)),
      expect: () => [
            DetailTvShowLoading(),
            DetailTvShowError('Server Failure'),
          ],
      verify: (bloc) {
        verify(mockGetTvShowDetail.execute(tId));
        verify(mockGetTvShowRecommendations.execute(tId));
      });

  blocTest<DetailTvShowBloc, DetailTvShowState>(
      'Should emit [Loading, HasData] when get TvShowRecommendations and DetailTvShow is successful',
      build: () {
        when(mockGetTvShowDetail.execute(tId))
            .thenAnswer((_) async => Right(tDetailTvShow));
        when(mockGetTvShowRecommendations.execute(tId))
            .thenAnswer((_) async => Right(tListTvShow));
        return detailTvShowBloc;
      },
      act: (bloc) => bloc.add(FetchDetailTvShow(tId)),
      expect: () => [
            DetailTvShowLoading(),
            DetailTvShowHasData(tDetailTvShow, tListTvShow)
          ],
      verify: (bloc) {
        verify(mockGetTvShowDetail.execute(tId));
        verify(mockGetTvShowRecommendations.execute(tId));
      });
}
