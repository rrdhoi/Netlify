import 'package:core/core.dart';
import 'package:core/presentation/bloc/tvshow/watchlist/watchlist_tv_show_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/tvshow_card_list.dart';

class WatchlistTvShowsPage extends StatelessWidget {
  const WatchlistTvShowsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<WatchlistTvShowBloc, WatchlistTvShowState>(
        builder: (context, data) {
          if (data is WatchlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (data is WatchlistHasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final tvShow = data.tvShows[index];
                return TvShowCard(tvShow);
              },
              itemCount: data.tvShows.length,
            );
          } else if (data is WatchlistError) {
            return Text(data.message);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
