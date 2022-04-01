import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedTvShowsPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-tvShows';

  const TopRatedTvShowsPage({Key? key}) : super(key: key);

  @override
  State<TopRatedTvShowsPage> createState() => _TopRatedTvShowsPageState();
}

class _TopRatedTvShowsPageState extends State<TopRatedTvShowsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<TopRatedTvShowBloc>().add(FetchTopRatedTvShow()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedTvShowBloc, TopRatedTvShowState>(
          builder: (context, data) {
            if (data is TopRatedLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data is TopRatedHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvShows = data.tvShows[index];
                  return TvShowCard(tvShows);
                },
                itemCount: data.tvShows.length,
              );
            } else if (data is TopRatedError) {
              return Center(
                key: Key('error_message'),
                child: Text(data.message),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
