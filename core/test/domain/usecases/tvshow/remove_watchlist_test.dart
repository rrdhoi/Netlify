import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveWatchlistTvShow useCase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    useCase = RemoveWatchlistTvShow(mockTvShowRepository);
  });

  final tTvShows = testTvShowDetail;

  test('Should remove watchlist tvShow from repository', () async {
    when(mockTvShowRepository.removeWatchlist(tTvShows))
        .thenAnswer((_) async => Right('Removed from Watchlist'));
    final result = await useCase.execute(tTvShows);

    // assert
    verify(mockTvShowRepository.removeWatchlist(tTvShows));
    expect(result, Right('Removed from Watchlist'));
  });
}
