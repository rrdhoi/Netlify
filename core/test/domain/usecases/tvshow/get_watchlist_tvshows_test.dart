import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchlistTvShow useCase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    useCase = GetWatchlistTvShow(mockTvShowRepository);
  });

  final tTvShows = <TvShow>[];

  test('Should get watchlist tvShows from repository', () async {
    when(mockTvShowRepository.getWatchlistTvShows())
        .thenAnswer((_) async => Right(tTvShows));
    final result = await useCase.execute();

    // assert
    final resultList = result.getOrElse(() => []);
    verify(mockTvShowRepository.getWatchlistTvShows());
    expect(resultList, tTvShows);
  });
}
