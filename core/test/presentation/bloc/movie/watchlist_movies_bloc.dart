import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'watchlist_movies_bloc.mocks.dart';

@GenerateMocks([GetWatchlistMovies])
void main() {
  late WatchlistMoviesBloc watchlistMoviesBloc;
  late MockGetWatchlistMovies mockGetWatchlistMovies;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    watchlistMoviesBloc = WatchlistMoviesBloc(mockGetWatchlistMovies);
  });

  final tListMovie = [testMovie];

  test('initial state should be empty', () {
    expect(watchlistMoviesBloc.state, WatchlistMoviesEmpty());
  });

  blocTest<WatchlistMoviesBloc, WatchlistMoviesState>(
      'Should emit [Loading, Error] when get WatchlistMovies is unsuccessful',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return watchlistMoviesBloc;
      },
      act: (bloc) {
        bloc.add(FetchWatchlistMovies());
      },
      expect: () => [
            WatchlistMoviesLoading(),
            WatchlistMoviesError('Server Failure'),
          ],
      verify: (bloc) {
        verify(mockGetWatchlistMovies.execute());
      });

  blocTest<WatchlistMoviesBloc, WatchlistMoviesState>(
      'Should emit [Loading, HasData] when get WatchlistMovies is successful',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => Right(tListMovie));
        return watchlistMoviesBloc;
      },
      act: (bloc) {
        bloc.add(FetchWatchlistMovies());
      },
      expect: () => [
            WatchlistMoviesLoading(),
            WatchlistMoviesHasData(tListMovie),
          ],
      verify: (bloc) {
        verify(mockGetWatchlistMovies.execute());
      });
}
