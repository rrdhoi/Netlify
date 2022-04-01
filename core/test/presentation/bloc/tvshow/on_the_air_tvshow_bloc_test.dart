import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'on_the_air_tvshow_bloc_test.mocks.dart';

@GenerateMocks([GetTvShowOnTheAir])
void main() {
  late OnTheAirTvShowBloc onTheAirTvShowBloc;
  late MockGetTvShowOnTheAir mockGetTvShowOnTheAir;

  setUp(() {
    mockGetTvShowOnTheAir = MockGetTvShowOnTheAir();
    onTheAirTvShowBloc = OnTheAirTvShowBloc(mockGetTvShowOnTheAir);
  });

  final tListTvShow = testTvShowList;

  test('initial state should be empty', () {
    expect(onTheAirTvShowBloc.state, OnTheAirTvShowEmpty());
  });

  blocTest<OnTheAirTvShowBloc, OnTheAirTvShowState>(
      'Should emit [Loading, Error] when get OnTheAirTvShow is unsuccessful',
      build: () {
        when(mockGetTvShowOnTheAir.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return onTheAirTvShowBloc;
      },
      act: (bloc) {
        bloc.add(FetchOnTheAirTvShow());
      },
      expect: () => [
            OnTheAirTvShowLoading(),
            OnTheAirTvShowError('Server Failure'),
          ],
      verify: (bloc) {
        verify(mockGetTvShowOnTheAir.execute());
      });

  blocTest<OnTheAirTvShowBloc, OnTheAirTvShowState>(
      'Should emit [Loading, HasData] when get OnTheAirTvShow is successful',
      build: () {
        when(mockGetTvShowOnTheAir.execute())
            .thenAnswer((_) async => Right(tListTvShow));
        return onTheAirTvShowBloc;
      },
      act: (bloc) {
        bloc.add(FetchOnTheAirTvShow());
      },
      expect: () =>
          [OnTheAirTvShowLoading(), OnTheAirTvShowHasData(tListTvShow)],
      verify: (bloc) {
        verify(mockGetTvShowOnTheAir.execute());
      });
}
