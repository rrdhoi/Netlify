import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'now_playing_bloc_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies])
void main() {
  late NowPlayingBloc nowPlayingBloc;
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    nowPlayingBloc = NowPlayingBloc(mockGetNowPlayingMovies);
  });

  final tListMovie = [testMovie];

  test('initial state should be empty', () {
    expect(nowPlayingBloc.state, NowPlayingMovieEmpty());
  });

  blocTest<NowPlayingBloc, NowPlayingState>(
      'Should emit [Loading, Error] when get NowPlayingMovie is unsuccessful',
      build: () {
        when(mockGetNowPlayingMovies.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return nowPlayingBloc;
      },
      act: (bloc) {
        bloc.add(FetchNowPlayingMovie());
      },
      expect: () => [
            NowPlayingMovieLoading(),
            NowPlayingMovieError('Server Failure'),
          ],
      verify: (bloc) {
        verify(mockGetNowPlayingMovies.execute());
      });

  blocTest<NowPlayingBloc, NowPlayingState>(
      'Should emit [Loading, HasData] when get NowPlayingMovie is successful',
      build: () {
        when(mockGetNowPlayingMovies.execute())
            .thenAnswer((_) async => Right(tListMovie));
        return nowPlayingBloc;
      },
      act: (bloc) {
        bloc.add(FetchNowPlayingMovie());
      },
      expect: () => [
            NowPlayingMovieLoading(),
            NowPlayingMovieHasData(tListMovie),
          ],
      verify: (bloc) {
        verify(mockGetNowPlayingMovies.execute());
      });
}
