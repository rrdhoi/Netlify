import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'popular_movies_bloc_test.mocks.dart';

@GenerateMocks([GetPopularMovies])
void main() {
  late PopularMoviesBloc popularMoviesBloc;
  late MockGetPopularMovies mockGetPopularMovies;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    popularMoviesBloc = PopularMoviesBloc(mockGetPopularMovies);
  });

  final tListMovie = [testMovie];

  test('initial state should be empty', () {
    expect(popularMoviesBloc.state, PopularMovieEmpty());
  });

  blocTest<PopularMoviesBloc, PopularMoviesState>(
      'Should emit [Loading, Error] when get PopularMovies is unsuccessful',
      build: () {
        when(mockGetPopularMovies.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return popularMoviesBloc;
      },
      act: (bloc) {
        bloc.add(FetchPopularMovies());
      },
      expect: () => [
            PopularMovieLoading(),
            PopularMovieError('Server Failure'),
          ],
      verify: (bloc) {
        verify(mockGetPopularMovies.execute());
      });

  blocTest<PopularMoviesBloc, PopularMoviesState>(
      'Should emit [Loading, HasData] when get PopularMovies is successful',
      build: () {
        when(mockGetPopularMovies.execute())
            .thenAnswer((_) async => Right(tListMovie));
        return popularMoviesBloc;
      },
      act: (bloc) {
        bloc.add(FetchPopularMovies());
      },
      expect: () => [
            PopularMovieLoading(),
            PopularMovieHasData(tListMovie),
          ],
      verify: (bloc) {
        verify(mockGetPopularMovies.execute());
      });
}
