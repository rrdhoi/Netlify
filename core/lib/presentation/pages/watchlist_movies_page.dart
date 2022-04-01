import 'package:core/presentation/bloc/movies/watchlist/watchlist_movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/movie_card_list.dart';

class WatchlistMoviesPage extends StatelessWidget {
  const WatchlistMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<WatchlistMoviesBloc, WatchlistMoviesState>(
        builder: (context, data) {
          if (data is WatchlistMoviesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (data is WatchlistMoviesHasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final movies = data.movies[index];
                return MovieCard(movies);
              },
              itemCount: data.movies.length,
            );
          } else if (data is WatchlistMoviesError) {
            return Text(data.message);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
