part of 'detail_watchlist_movie_bloc.dart';

abstract class DetailWatchlistMovieEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadWatchlistMovieStatus extends DetailWatchlistMovieEvent {
  final int id;
  LoadWatchlistMovieStatus(this.id);

  @override
  List<Object?> get props => [id];
}

class AddWatchlistMovieEvent extends DetailWatchlistMovieEvent {
  final MovieDetail movieDetail;
  AddWatchlistMovieEvent(this.movieDetail);

  @override
  List<Object?> get props => [MovieDetail];
}

class RemoveWatchlistMovieEvent extends DetailWatchlistMovieEvent {
  final MovieDetail movieDetail;
  RemoveWatchlistMovieEvent(this.movieDetail);

  @override
  List<Object?> get props => [MovieDetail];
}
