import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'top_rated_tvshows_bloc_test.mocks.dart';

@GenerateMocks([GetTopRatedTvShow])
void main() {
  late TopRatedTvShowBloc topRatedTvShowBloc;
  late MockGetTopRatedTvShow mockGetTopRatedTvShow;

  setUp(() {
    mockGetTopRatedTvShow = MockGetTopRatedTvShow();
    topRatedTvShowBloc = TopRatedTvShowBloc(mockGetTopRatedTvShow);
  });

  final tListTvShow = testTvShowList;

  test('initial state should be empty', () {
    expect(topRatedTvShowBloc.state, TopRatedEmpty());
  });

  blocTest<TopRatedTvShowBloc, TopRatedTvShowState>(
      'Should emit [Loading, Error] when get TopRatedTvShows is unsuccessful',
      build: () {
        when(mockGetTopRatedTvShow.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return topRatedTvShowBloc;
      },
      act: (bloc) {
        bloc.add(FetchTopRatedTvShow());
      },
      expect: () => [
            TopRatedLoading(),
            TopRatedError('Server Failure'),
          ],
      verify: (bloc) {
        verify(mockGetTopRatedTvShow.execute());
      });

  blocTest<TopRatedTvShowBloc, TopRatedTvShowState>(
      'Should emit [Loading, HasData] when get TopRatedTvShows is successful',
      build: () {
        when(mockGetTopRatedTvShow.execute())
            .thenAnswer((_) async => Right(tListTvShow));
        return topRatedTvShowBloc;
      },
      act: (bloc) {
        bloc.add(FetchTopRatedTvShow());
      },
      expect: () => [
            TopRatedLoading(),
            TopRatedHasData(tListTvShow),
          ],
      verify: (bloc) {
        verify(mockGetTopRatedTvShow.execute());
      });
}
