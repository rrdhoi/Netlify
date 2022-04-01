import 'package:core/core.dart';
import 'package:core/presentation/bloc/movies/watchlist/watchlist_movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../bloc/tvshow/watchlist/watchlist_tv_show_bloc.dart';
import 'watchlist_movies_page.dart';
import 'watchlist_tvshows_page.dart';

class WatchlistPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-page';

  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage>
    with RouteAware, SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<WatchlistMoviesBloc>().add(FetchWatchlistMovies()));
    Future.microtask(
        () => context.read<WatchlistTvShowBloc>().add(FetchWatchlistTvShow()));
    controller = TabController(vsync: this, length: 2);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    context.read<WatchlistMoviesBloc>().add(FetchWatchlistMovies());
    context.read<WatchlistTvShowBloc>().add(FetchWatchlistTvShow());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist'),
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(
              text: "Movies",
            ),
            Tab(
              text: "TV Shows",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          WatchlistMoviesPage(),
          WatchlistTvShowsPage(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    controller.dispose();
    super.dispose();
  }
}
