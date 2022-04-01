import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'top_rated_movies_bloc_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late TopRatedMoviesBloc topRatedMoviesBloc;
  late MockGetTopRatedMovies mockGetTopRatedMovies;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    topRatedMoviesBloc = TopRatedMoviesBloc(mockGetTopRatedMovies);
  });

  final tListMovie = [testMovie];

  test('initial state should be empty', () {
    expect(topRatedMoviesBloc.state, TopRatedMovieEmpty());
  });

  blocTest<TopRatedMoviesBloc, TopRatedMoviesState>(
      'Should emit [Loading, Error] when get TopRatedMovies is unsuccessful',
      build: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return topRatedMoviesBloc;
      },
      act: (bloc) {
        bloc.add(FetchTopRatedMovies());
      },
      expect: () => [
            TopRatedMovieLoading(),
            TopRatedMovieError('Server Failure'),
          ],
      verify: (bloc) {
        verify(mockGetTopRatedMovies.execute());
      });

  blocTest<TopRatedMoviesBloc, TopRatedMoviesState>(
      'Should emit [Loading, HasData] when get TopRatedMovies is successful',
      build: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async => Right(tListMovie));
        return topRatedMoviesBloc;
      },
      act: (bloc) {
        bloc.add(FetchTopRatedMovies());
      },
      expect: () => [
            TopRatedMovieLoading(),
            TopRatedMovieHasData(tListMovie),
          ],
      verify: (bloc) {
        verify(mockGetTopRatedMovies.execute());
      });
}
