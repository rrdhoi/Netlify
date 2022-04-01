import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'detail_watchlist_movie_bloc_test.mocks.dart';

@GenerateMocks([GetWatchListStatus, SaveWatchlist, RemoveWatchlist])
void main() {
  late DetailWatchlistMovieBloc watchlistMovieBloc;
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;

  setUp(() {
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockRemoveWatchlist = MockRemoveWatchlist();
    mockSaveWatchlist = MockSaveWatchlist();
    watchlistMovieBloc = DetailWatchlistMovieBloc(
        mockGetWatchListStatus, mockSaveWatchlist, mockRemoveWatchlist);
  });

  final tMovieDetail = testMovieDetail;
  const tId = 0;
  const watchlistAddSuccessMessage = 'Added to Watchlist';
  const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  test('initial state should be empty', () {
    expect(watchlistMovieBloc.state, DetailWatchlistMovieEmpty());
  });

  blocTest<DetailWatchlistMovieBloc, DetailWatchlistMovieState>(
      'Should emit [Loading, Error] when SaveWatchlist is unsuccessful',
      build: () {
        when(mockSaveWatchlist.execute(tMovieDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
        return watchlistMovieBloc;
      },
      act: (bloc) {
        bloc.add(AddWatchlistMovieEvent(tMovieDetail));
      },
      expect: () => [
            DetailWatchlistMovieStatus('Failed'),
          ],
      verify: (bloc) {
        verify(mockSaveWatchlist.execute(tMovieDetail));
      });

  blocTest<DetailWatchlistMovieBloc, DetailWatchlistMovieState>(
      'Should emit [Loading, IsAdded] when SaveWatchlist is successful',
      build: () {
        when(mockSaveWatchlist.execute(tMovieDetail))
            .thenAnswer((_) async => const Right(watchlistAddSuccessMessage));
        return watchlistMovieBloc;
      },
      act: (bloc) {
        bloc.add(AddWatchlistMovieEvent(tMovieDetail));
      },
      expect: () => [
            IsAddedToWatchlistMovie(true),
          ],
      verify: (bloc) {
        verify(mockSaveWatchlist.execute(tMovieDetail));
      });

  blocTest<DetailWatchlistMovieBloc, DetailWatchlistMovieState>(
      'Should emit [Loading, Error] when RemoveWatchlist is unsuccessful',
      build: () {
        when(mockRemoveWatchlist.execute(tMovieDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
        return watchlistMovieBloc;
      },
      act: (bloc) {
        bloc.add(RemoveWatchlistMovieEvent(tMovieDetail));
      },
      expect: () => [
            DetailWatchlistMovieStatus('Failed'),
          ],
      verify: (bloc) {
        verify(mockRemoveWatchlist.execute(tMovieDetail));
      });

  blocTest<DetailWatchlistMovieBloc, DetailWatchlistMovieState>(
      'Should emit [Loading, IsAdded] when RemoveWatchlist is successful',
      build: () {
        when(mockRemoveWatchlist.execute(tMovieDetail)).thenAnswer(
            (_) async => const Right(watchlistRemoveSuccessMessage));
        return watchlistMovieBloc;
      },
      act: (bloc) {
        bloc.add(RemoveWatchlistMovieEvent(tMovieDetail));
      },
      expect: () => [
            IsAddedToWatchlistMovie(false),
          ],
      verify: (bloc) {
        verify(mockRemoveWatchlist.execute(tMovieDetail));
      });

  blocTest<DetailWatchlistMovieBloc, DetailWatchlistMovieState>(
      'Should emit [Loading, IsAdded] when get WatchlistMovies is successful',
      build: () {
        when(mockGetWatchListStatus.execute(tId)).thenAnswer((_) async => true);
        return watchlistMovieBloc;
      },
      act: (bloc) {
        bloc.add(LoadWatchlistMovieStatus(tId));
      },
      expect: () => [
            IsAddedToWatchlistMovie(true),
          ],
      verify: (bloc) {
        verify(mockGetWatchListStatus.execute(tId));
      });
}
