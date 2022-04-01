import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search/domain/usescases/tvshow/search_tvshow.dart';

import '../../../../../core/test/helpers/test_helper.mocks.dart';

void main() {
  late SearchTvShow useCase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    useCase = SearchTvShow(mockTvShowRepository);
  });

  final List<TvShow> tTvShows = [];
  final tQuery = 'Jujutsu No Kaisen';

  test('Should get list of tvShows from repository', () async {
    // arrange
    when(mockTvShowRepository.searchTvShows(tQuery))
        .thenAnswer((_) async => Right(tTvShows));

    //act
    final result = await useCase.execute(tQuery);

    //assert
    final resultList = result.getOrElse(() => []);
    verify(mockTvShowRepository.searchTvShows(tQuery));
    expect(resultList, tTvShows);
  });
}
