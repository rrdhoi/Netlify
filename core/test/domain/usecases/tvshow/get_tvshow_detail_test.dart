import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvShowDetail useCase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    useCase = GetTvShowDetail(mockTvShowRepository);
  });

  final tTvShows = testTvShowDetail;
  final tId = 1;

  test('Should get detail of tvShow from repository', () async {
    // arrange
    when(mockTvShowRepository.getTvShowDetail(tId))
        .thenAnswer((_) async => Right(tTvShows));

    //act
    final result = await useCase.execute(tId);

    //assert
    verify(mockTvShowRepository.getTvShowDetail(tId));
    expect(result, Right(tTvShows));
  });
}
