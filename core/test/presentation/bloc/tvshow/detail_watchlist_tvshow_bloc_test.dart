import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'detail_watchlist_tvshow_bloc_test.mocks.dart';

@GenerateMocks(
    [GetWatchlistTvShowStatus, SaveWatchlistTvShow, RemoveWatchlistTvShow])
void main() {
  late DetailWatchlistBloc watchlistTvShowBloc;
  late MockGetWatchlistTvShowStatus mockGetWatchlistTvShowStatus;
  late MockSaveWatchlistTvShow mockSaveWatchlistTvShow;
  late MockRemoveWatchlistTvShow mockRemoveWatchlistTvShow;

  setUp(() {
    mockGetWatchlistTvShowStatus = MockGetWatchlistTvShowStatus();
    mockRemoveWatchlistTvShow = MockRemoveWatchlistTvShow();
    mockSaveWatchlistTvShow = MockSaveWatchlistTvShow();
    watchlistTvShowBloc = DetailWatchlistBloc(mockGetWatchlistTvShowStatus,
        mockSaveWatchlistTvShow, mockRemoveWatchlistTvShow);
  });

  final tTvShowDetail = testTvShowDetail;
  const tId = 0;
  const watchlistAddSuccessMessage = 'Added to Watchlist';
  const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  test('initial state should be empty', () {
    expect(watchlistTvShowBloc.state, DetailWatchListEmpty());
  });

  blocTest<DetailWatchlistBloc, DetailWatchlistState>(
      'Should emit [Loading, Error] when SaveWatchlist is unsuccessful',
      build: () {
        when(mockSaveWatchlistTvShow.execute(tTvShowDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
        return watchlistTvShowBloc;
      },
      act: (bloc) {
        bloc.add(AddWatchListEvent(tTvShowDetail));
      },
      expect: () => [
            DetailWatchlistStatus('Failed'),
          ],
      verify: (bloc) {
        verify(mockSaveWatchlistTvShow.execute(tTvShowDetail));
      });

  blocTest<DetailWatchlistBloc, DetailWatchlistState>(
      'Should emit [Loading, IsAdded] when SaveWatchlist is successful',
      build: () {
        when(mockSaveWatchlistTvShow.execute(tTvShowDetail))
            .thenAnswer((_) async => const Right(watchlistAddSuccessMessage));
        return watchlistTvShowBloc;
      },
      act: (bloc) {
        bloc.add(AddWatchListEvent(tTvShowDetail));
      },
      expect: () => [
            IsAddedToWatchList(true),
          ],
      verify: (bloc) {
        verify(mockSaveWatchlistTvShow.execute(tTvShowDetail));
      });

  blocTest<DetailWatchlistBloc, DetailWatchlistState>(
      'Should emit [Loading, Error] when RemoveWatchlist is unsuccessful',
      build: () {
        when(mockRemoveWatchlistTvShow.execute(tTvShowDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
        return watchlistTvShowBloc;
      },
      act: (bloc) {
        bloc.add(RemoveWatchlistEvent(tTvShowDetail));
      },
      expect: () => [
            DetailWatchlistStatus('Failed'),
          ],
      verify: (bloc) {
        verify(mockRemoveWatchlistTvShow.execute(tTvShowDetail));
      });

  blocTest<DetailWatchlistBloc, DetailWatchlistState>(
      'Should emit [Loading, IsAdded] when RemoveWatchlist is successful',
      build: () {
        when(mockRemoveWatchlistTvShow.execute(tTvShowDetail)).thenAnswer(
            (_) async => const Right(watchlistRemoveSuccessMessage));
        return watchlistTvShowBloc;
      },
      act: (bloc) {
        bloc.add(RemoveWatchlistEvent(tTvShowDetail));
      },
      expect: () => [
            IsAddedToWatchList(false),
          ],
      verify: (bloc) {
        verify(mockRemoveWatchlistTvShow.execute(tTvShowDetail));
      });

  blocTest<DetailWatchlistBloc, DetailWatchlistState>(
      'Should emit [Loading, IsAdded] when get WatchlistTvShows is successful',
      build: () {
        when(mockGetWatchlistTvShowStatus.execute(tId))
            .thenAnswer((_) async => true);
        return watchlistTvShowBloc;
      },
      act: (bloc) {
        bloc.add(LoadWatchlistStatus(tId));
      },
      expect: () => [
            IsAddedToWatchList(true),
          ],
      verify: (bloc) {
        verify(mockGetWatchlistTvShowStatus.execute(tId));
      });
}
