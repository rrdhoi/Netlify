
import '../../../utils/exception.dart';
import '../../models/tvshow/tv_table.dart';
import '../db/database_helper.dart';

abstract class TvShowLocalDataSource {
  Future<String> insertWatchlist(TvShowTable tvShow);

  Future<String> removeWatchlist(TvShowTable tvShow);

  Future<TvShowTable?> getTvShowById(int id);

  Future<List<TvShowTable>> getWatchlistTvShow();
}

class TvShowLocalDataSourceImpl implements TvShowLocalDataSource {
  final DatabaseHelper databaseHelper;

  TvShowLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<TvShowTable?> getTvShowById(int id) async {
    final result = await databaseHelper.getTvShowById(id);
    if (result != null) {
      return TvShowTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TvShowTable>> getWatchlistTvShow() async {
    final result = await databaseHelper.getWatchlistTvShows();
    return result.map((data) => TvShowTable.fromMap(data)).toList();
  }

  @override
  Future<String> insertWatchlist(TvShowTable tvShow) async {
    try {
      await databaseHelper.insertWatchlistTvShow(tvShow);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlist(TvShowTable tvShow) async {
    try {
      await databaseHelper.removeWatchlistTvShow(tvShow);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
