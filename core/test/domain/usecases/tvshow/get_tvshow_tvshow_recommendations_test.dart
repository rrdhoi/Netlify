import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvShowRecommendations useCase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    useCase = GetTvShowRecommendations(mockTvShowRepository);
  });

  final List<TvShow> tTvShows = [];
  final tId = 1;

  test('Should get detail of tvShow from repository', () async {
    // arrange
    when(mockTvShowRepository.getTvShowRecommendations(tId))
        .thenAnswer((_) async => Right(tTvShows));

    //act
    final result = await useCase.execute(tId);

    //assert
    final resultList = result.getOrElse(() => []);
    verify(mockTvShowRepository.getTvShowRecommendations(tId));
    expect(resultList, tTvShows);
  });
}
