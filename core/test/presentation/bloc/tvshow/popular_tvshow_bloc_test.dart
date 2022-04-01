import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'popular_tvshow_bloc_test.mocks.dart';

@GenerateMocks([GetPopularTvShow])
void main() {
  late PopularTvShowBloc popularTvShowBloc;
  late MockGetPopularTvShow mockGetPopularTvShow;

  setUp(() {
    mockGetPopularTvShow = MockGetPopularTvShow();
    popularTvShowBloc = PopularTvShowBloc(mockGetPopularTvShow);
  });

  final tListMovie = testTvShowList;

  test('initial state should be empty', () {
    expect(popularTvShowBloc.state, PopularEmpty());
  });

  blocTest<PopularTvShowBloc, PopularTvShowState>(
      'Should emit [Loading, Error] when get PopularMovies is unsuccessful',
      build: () {
        when(mockGetPopularTvShow.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return popularTvShowBloc;
      },
      act: (bloc) {
        bloc.add(FetchPopularTvShow());
      },
      expect: () => [
            PopularLoading(),
            PopularError('Server Failure'),
          ],
      verify: (bloc) {
        verify(mockGetPopularTvShow.execute());
      });

  blocTest<PopularTvShowBloc, PopularTvShowState>(
      'Should emit [Loading, HasData] when get PopularMovies is successful',
      build: () {
        when(mockGetPopularTvShow.execute())
            .thenAnswer((_) async => Right(tListMovie));
        return popularTvShowBloc;
      },
      act: (bloc) {
        bloc.add(FetchPopularTvShow());
      },
      expect: () => [
            PopularLoading(),
            PopularHasData(tListMovie),
          ],
      verify: (bloc) {
        verify(mockGetPopularTvShow.execute());
      });
}
