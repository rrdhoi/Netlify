import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late TvShowLocalDataSourceImpl dataSourceImpl;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSourceImpl =
        TvShowLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('save watchlist tvShow', () {
    test('should return success message when insert to database is success',
        () async {
      //arrange
      when(mockDatabaseHelper.insertWatchlistTvShow(testTvShowTable))
          .thenAnswer((_) async => 1);
      //act
      final result = await dataSourceImpl.insertWatchlist(testTvShowTable);
      //assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlistTvShow(testTvShowTable))
          .thenThrow(Exception());
      // act
      final call = dataSourceImpl.insertWatchlist(testTvShowTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      //arrange
      when(mockDatabaseHelper.removeWatchlistTvShow(testTvShowTable))
          .thenAnswer((_) async => 1);

      //act
      final result = await dataSourceImpl.removeWatchlist(testTvShowTable);

      //assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlistTvShow(testTvShowTable))
          .thenThrow(Exception());

      // act
      final call = dataSourceImpl.removeWatchlist(testTvShowTable);

      //assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get tvShow Detail By Id', () {
    final tId = 1;

    test('should return TvShow Detail Table when data is found', () async {
      when(mockDatabaseHelper.getTvShowById(tId))
          .thenAnswer((_) async => testTvShowMap);
      final result = await dataSourceImpl.getTvShowById(tId);
      expect(result, testTvShowTable);
    });

    test('should return null when data is not found', () async {
      when(mockDatabaseHelper.getTvShowById(tId)).thenAnswer((_) async => null);

      final result = await dataSourceImpl.getTvShowById(tId);
      expect(result, null);
    });
  });

  group('get watchlist tvShows', () {
    test('should return list of TvShowTable from database', () async {
      when(mockDatabaseHelper.getWatchlistTvShows())
          .thenAnswer((_) async => [testTvShowMap]);
      final result = await dataSourceImpl.getWatchlistTvShow();
      expect(result, [testTvShowTable]);
    });
  });
}
