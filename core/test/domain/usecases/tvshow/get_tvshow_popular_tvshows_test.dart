import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularTvShow useCase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    useCase = GetPopularTvShow(mockTvShowRepository);
  });

  final List<TvShow> tTvShows = [];

  test('Should get list of tvShows from repository', () async {
    // arrange
    when(mockTvShowRepository.getPopularTvShows())
        .thenAnswer((_) async => Right(tTvShows));

    //act
    final result = await useCase.execute();

    //assert
    final resultList = result.getOrElse(() => []);
    verify(mockTvShowRepository.getPopularTvShows());
    expect(resultList, tTvShows);
  });
}
