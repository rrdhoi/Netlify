import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NowPlayingBloc>().add(FetchNowPlayingMovie());
      context.read<PopularMoviesBloc>().add(FetchPopularMovies());
      context.read<TopRatedMoviesBloc>().add(FetchTopRatedMovies());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Now Playing',
              style: kHeading6,
            ),
            BlocBuilder<NowPlayingBloc, NowPlayingState>(
                builder: (context, data) {
              if (data is NowPlayingMovieLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data is NowPlayingMovieHasData) {
                return MovieList(data.movies);
              } else if (data is NowPlayingMovieError) {
                return Text(data.message);
              } else {
                return const SizedBox();
              }
            }),
            customSubHeading(
              title: 'Popular',
              onTap: () =>
                  Navigator.pushNamed(context, PopularMoviesPage.ROUTE_NAME),
            ),
            BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                builder: (context, data) {
              if (data is PopularMovieLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data is PopularMovieHasData) {
                return MovieList(data.movies);
              } else if (data is PopularMovieError) {
                return Text(data.message);
              } else {
                return const SizedBox();
              }
            }),
            customSubHeading(
              title: 'Top Rated',
              onTap: () =>
                  Navigator.pushNamed(context, TopRatedMoviesPage.ROUTE_NAME),
            ),
            BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
                builder: (context, data) {
              if (data is TopRatedMovieLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data is TopRatedMovieHasData) {
                return MovieList(data.movies);
              } else if (data is TopRatedMovieError) {
                return Text(data.message);
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
