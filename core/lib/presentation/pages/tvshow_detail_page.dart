import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../core.dart';

class TvShowDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/tvShow-detail';

  final int id;

  const TvShowDetailPage({required this.id, Key? key}) : super(key: key);

  @override
  State<TvShowDetailPage> createState() => _TvShowDetailPageState();
}

class _TvShowDetailPageState extends State<TvShowDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<DetailTvShowBloc>().add(FetchDetailTvShow(widget.id));
      context.read<DetailWatchlistBloc>().add(LoadWatchlistStatus(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailTvShowBloc, DetailTvShowState>(
          builder: (context, data) {
        if (data is DetailTvShowLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (data is DetailTvShowHasData) {
          return TvShowDetailContent(data.tvShow, data.recommendations);
        } else if (data is DetailTvShowError) {
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

class TvShowDetailContent extends StatelessWidget {
  final TvShowDetail tvShow;
  final List<TvShow> recommendations;

  const TvShowDetailContent(this.tvShow, this.recommendations, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${tvShow.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) =>
              Center(child: Icon(Icons.error)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48),
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
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tvShow.name,
                              style: kHeading5,
                            ),
                            BlocBuilder<DetailWatchlistBloc,
                                    DetailWatchlistState>(
                                builder: (context, state) {
                              if (state is IsAddedToWatchList) {
                                return ElevatedButton(
                                  onPressed: () async {
                                    if (!state.isAdded) {
                                      context
                                          .read<DetailWatchlistBloc>()
                                          .add(AddWatchListEvent(tvShow));
                                    } else {
                                      context
                                          .read<DetailWatchlistBloc>()
                                          .add(RemoveWatchlistEvent(tvShow));
                                    }
                                    String message = !state.isAdded
                                        ? DetailWatchlistBloc
                                            .watchlistAddSuccessMessage
                                        : DetailWatchlistBloc
                                            .watchlistRemoveSuccessMessage;

                                    if (message ==
                                            DetailWatchlistBloc
                                                .watchlistAddSuccessMessage ||
                                        message ==
                                            DetailWatchlistBloc
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
                            Text(_showGenres(tvShow)),
                            Text(tvShow.status),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                  itemCount: 5,
                                  rating: tvShow.voteAverage / 2,
                                ),
                                Text('${tvShow.voteAverage}')
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(tvShow.overview),
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
                            Text(
                              'Seasons',
                              style: kHeading6,
                            ),
                            SizedBox(
                              height: 150,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: tvShow.seasons.length,
                                itemBuilder: (context, index) {
                                  final season = tvShow.seasons[index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, TvShowDetailPage.ROUTE_NAME,
                                          arguments: season.id);
                                    },
                                    child:
                                        _customCard(context, season.posterPath),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Last Episode',
                              style: kHeading6,
                            ),
                            SizedBox(
                              height: 150,
                              child: _customCard(
                                  context, tvShow.lastEpisode.stillPath),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            minChildSize: 0.45,
            maxChildSize: 0.95,
          ),
        ),
      ],
    );
  }

  String _showGenres(TvShowDetail tvShowDetail) {
    var _restaurantItemFoods = StringBuffer();
    _restaurantItemFoods.writeAll(
        tvShowDetail.genres.map((genres) => genres.name), ', ');
    return _restaurantItemFoods.toString();
  }

  Widget _buildRecommendationsContent(List<TvShow> recommendations) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          final tvShow = recommendations[index];
          return InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, TvShowDetailPage.ROUTE_NAME,
                  arguments: tvShow.id);
            },
            child: _customCard(context, tvShow.posterPath),
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
}
