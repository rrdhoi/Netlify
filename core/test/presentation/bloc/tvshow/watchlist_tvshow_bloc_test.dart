import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'watchlist_tvshow_bloc_test.mocks.dart';

@GenerateMocks([GetWatchlistTvShow])
void main() {
  late WatchlistTvShowBloc watchlistTvShowBloc;
  late MockGetWatchlistTvShow mockGetWatchlistTvShow;

  setUp(() {
    mockGetWatchlistTvShow = MockGetWatchlistTvShow();
    watchlistTvShowBloc = WatchlistTvShowBloc(mockGetWatchlistTvShow);
  });

  final tListMovie = [testTvShow];

  test('initial state should be empty', () {
    expect(watchlistTvShowBloc.state, WatchlistEmpty());
  });

  blocTest<WatchlistTvShowBloc, WatchlistTvShowState>(
      'Should emit [Loading, Error] when get WatchlistMovies is unsuccessful',
      build: () {
        when(mockGetWatchlistTvShow.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return watchlistTvShowBloc;
      },
      act: (bloc) {
        bloc.add(FetchWatchlistTvShow());
      },
      expect: () => [
            WatchlistLoading(),
            WatchlistError('Server Failure'),
          ],
      verify: (bloc) {
        verify(mockGetWatchlistTvShow.execute());
      });

  blocTest<WatchlistTvShowBloc, WatchlistTvShowState>(
      'Should emit [Loading, HasData] when get WatchlistMovies is successful',
      build: () {
        when(mockGetWatchlistTvShow.execute())
            .thenAnswer((_) async => Right(tListMovie));
        return watchlistTvShowBloc;
      },
      act: (bloc) {
        bloc.add(FetchWatchlistTvShow());
      },
      expect: () => [
            WatchlistLoading(),
            WatchlistHasData(tListMovie),
          ],
      verify: (bloc) {
        verify(mockGetWatchlistTvShow.execute());
      });
}
