import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late SaveWatchlistTvShow useCase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    useCase = SaveWatchlistTvShow(mockTvShowRepository);
  });

  final tTvShows = testTvShowDetail;

  test('Should save watchlist tvShow from repository', () async {
    when(mockTvShowRepository.saveWatchlist(tTvShows))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    final result = await useCase.execute(tTvShows);

    // assert
    verify(mockTvShowRepository.saveWatchlist(tTvShows));
    expect(result, Right('Added to Watchlist'));
  });
}
