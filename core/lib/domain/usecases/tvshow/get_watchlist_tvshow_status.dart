import '../../repositories/tvshow_repository.dart';

class GetWatchlistTvShowStatus {
  final TvShowRepository repository;

  GetWatchlistTvShowStatus(this.repository);

  Future<bool> execute(int id) => repository.isAddedToWatchlist(id);
}
