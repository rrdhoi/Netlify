import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search/domain/usescases/tvshow/search_tvshow.dart';
import 'package:search/presentation/bloc/tvshow/search/search_tv_show_bloc.dart';

import 'search_tvshow_bloc_test.mocks.dart';

@GenerateMocks([SearchTvShow])
void main() {
  late SearchTvShowBloc searchBloc;
  late MockSearchTvShow mockSearchTvShow;

  setUp(() {
    mockSearchTvShow = MockSearchTvShow();
    searchBloc = SearchTvShowBloc(mockSearchTvShow);
  });

  final testTvShow = TvShow(
      backdropPath: 'backdropPath',
      genreIds: [1, 2],
      id: 1,
      name: 'name',
      originalName: 'originalName',
      overview: 'overview',
      popularity: 7.8,
      posterPath: 'posterPath',
      voteAverage: 7.8,
      voteCount: 7);

  final tTvShowList = <TvShow>[testTvShow];
  const tQuery = 'spiderman';

  test('initial state should be empty', () {
    expect(searchBloc.state, SearchTvShowEmpty());
  });

  blocTest<SearchTvShowBloc, SearchTvShowState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockSearchTvShow.execute(tQuery))
          .thenAnswer((_) async => Right(tTvShowList));
      return searchBloc;
    },
    act: (bloc) => bloc.add(OnQueryTvShowChanged(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchTvShowLoading(),
      SearchTvShowHasData(tTvShowList),
    ],
    verify: (bloc) {
      verify(mockSearchTvShow.execute(tQuery));
    },
  );

  blocTest<SearchTvShowBloc, SearchTvShowState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockSearchTvShow.execute(tQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return searchBloc;
    },
    act: (bloc) => bloc.add(OnQueryTvShowChanged(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchTvShowLoading(),
      SearchTvShowError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockSearchTvShow.execute(tQuery));
    },
  );
}
