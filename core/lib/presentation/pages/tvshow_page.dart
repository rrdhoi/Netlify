import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core.dart';

class TvShowPage extends StatefulWidget {
  const TvShowPage({Key? key}) : super(key: key);

  @override
  State<TvShowPage> createState() => _TvShowPageState();
}

class _TvShowPageState extends State<TvShowPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<OnTheAirTvShowBloc>().add(FetchOnTheAirTvShow());
      context.read<PopularTvShowBloc>().add(FetchPopularTvShow());
      context.read<TopRatedTvShowBloc>().add(FetchTopRatedTvShow());
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
            customSubHeading(
                title: 'On The Air',
                onTap: () {
                  Navigator.pushNamed(context, OnTheAirTvShowsPage.ROUTE_NAME);
                }),
            BlocBuilder<OnTheAirTvShowBloc, OnTheAirTvShowState>(
                builder: (context, data) {
              if (data is OnTheAirTvShowLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data is OnTheAirTvShowHasData) {
                return TvShowList(data.tvShows);
              } else if (data is OnTheAirTvShowError) {
                return Text(data.message);
              } else {
                return const SizedBox();
              }
            }),
            customSubHeading(
                title: 'Popular',
                onTap: () {
                  Navigator.pushNamed(context, PopularTvShowsPage.ROUTE_NAME);
                }),
            BlocBuilder<PopularTvShowBloc, PopularTvShowState>(
                builder: (context, data) {
              if (data is PopularLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data is PopularHasData) {
                return TvShowList(data.tvShows);
              } else if (data is PopularError) {
                return Text(data.message);
              } else {
                return const SizedBox();
              }
            }),
            customSubHeading(
                title: 'Top Rated',
                onTap: () {
                  Navigator.pushNamed(context, TopRatedTvShowsPage.ROUTE_NAME);
                }),
            BlocBuilder<TopRatedTvShowBloc, TopRatedTvShowState>(
                builder: (context, data) {
              if (data is TopRatedLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data is TopRatedHasData) {
                return TvShowList(data.tvShows);
              } else if (data is TopRatedError) {
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

class TvShowList extends StatelessWidget {
  final List<TvShow> tvShows;

  TvShowList(this.tvShows);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tvShow = tvShows[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvShowDetailPage.ROUTE_NAME,
                  arguments: tvShow.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tvShow.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvShows.length,
      ),
    );
  }
}
