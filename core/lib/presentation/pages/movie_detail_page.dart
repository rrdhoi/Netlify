import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../core.dart';

class MovieDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail';

  final int id;

  const MovieDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<DetailMovieBloc>().add(FetchDetailMovie(widget.id));
      context
          .read<DetailWatchlistMovieBloc>()
          .add(LoadWatchlistMovieStatus(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailMovieBloc, DetailMovieState>(
          builder: (context, data) {
        if (data is DetailMovieLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (data is DetailMovieHasData) {
          return DetailContent(data.movie, data.recommendations);
        } else if (data is DetailMovieError) {
          return Center(
            child: Text(data.message),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}

class DetailContent extends StatelessWidget {
  final MovieDetail movie;
  final List<Movie> recommendations;

  const DetailContent(this.movie, this.recommendations, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: kHeading5,
                            ),
                            BlocBuilder<DetailWatchlistMovieBloc,
                                    DetailWatchlistMovieState>(
                                builder: (context, state) {
                              if (state is IsAddedToWatchlistMovie) {
                                return ElevatedButton(
                                  onPressed: () async {
                                    if (!state.isAdded) {
                                      context
                                          .read<DetailWatchlistMovieBloc>()
                                          .add(AddWatchlistMovieEvent(movie));
                                    } else {
                                      context
                                          .read<DetailWatchlistMovieBloc>()
                                          .add(
                                              RemoveWatchlistMovieEvent(movie));
                                    }

                                    String message = !state.isAdded
                                        ? DetailWatchlistMovieBloc
                                            .watchlistAddSuccessMessage
                                        : DetailWatchlistMovieBloc
                                            .watchlistRemoveSuccessMessage;
                                    if (message ==
                                            DetailWatchlistMovieBloc
                                                .watchlistAddSuccessMessage ||
                                        message ==
                                            DetailWatchlistMovieBloc
                                                .watchlistRemoveSuccessMessage) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              SnackBar(content: Text(message)));
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Text(message),
                                            );
                                          });
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      state.isAdded
                                          ? Icon(Icons.check)
                                          : Icon(Icons.add),
                                      SizedBox(width: 6),
                                      const Text('Watchlist'),
                                    ],
                                  ),
                                );
                              } else {
                                return const SizedBox();
                              }
                            }),
                            Text(
                              _showGenres(movie.genres),
                            ),
                            Text(
                              _showDuration(movie.runtime),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: movie.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${movie.voteAverage}')
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              movie.overview,
                            ),
                            SizedBox(height: 16),
                            recommendations.isNotEmpty
                                ? Text(
                                    'Recommendations',
                                    style: kHeading6,
                                  )
                                : const SizedBox(),
                            recommendations.isNotEmpty
                                ? _buildRecommendationsContent(recommendations)
                                : const SizedBox(),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _buildRecommendationsContent(List<Movie> recommendations) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          final movie = recommendations[index];
          return InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, MovieDetailPage.ROUTE_NAME,
                  arguments: movie.id);
            },
            child: _customCard(context, movie.posterPath),
          );
        },
      ),
    );
  }

  Widget _customCard(BuildContext context, String? posterPath) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        child: posterPath != null
            ? CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/w500$posterPath',
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
            : Center(
                child: Icon(Icons.error),
              ),
      ),
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += genre.name + ', ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
