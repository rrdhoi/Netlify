import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvShowOnTheAir useCase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    useCase = GetTvShowOnTheAir(mockTvShowRepository);
  });

  final List<TvShow> tTvShows = [];

  test('Should get list of tvShows from repository', () async {
    // arrange
    when(mockTvShowRepository.getOnTheAirTvShow())
        .thenAnswer((_) async => Right(tTvShows));

    //act
    final result = await useCase.execute();

    //assert
    final resultList = result.getOrElse(() => []);
    verify(mockTvShowRepository.getOnTheAirTvShow());
    expect(resultList, tTvShows);
  });
}
