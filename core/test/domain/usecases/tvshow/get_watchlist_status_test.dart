import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchlistTvShowStatus useCase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    useCase = GetWatchlistTvShowStatus(mockTvShowRepository);
  });

  final tId = 1;

  test('Should get watch status whether data is found from repository',
      () async {
    when(mockTvShowRepository.isAddedToWatchlist(tId))
        .thenAnswer((_) async => true);
    final result = await useCase.execute(tId);
    verify(mockTvShowRepository.isAddedToWatchlist(tId));
    expect(result, true);
  });
}
