import 'package:core/core.dart';
import 'package:core/presentation/bloc/tvshow/popular/popular_tv_show_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/tvshow_card_list.dart';

class PopularTvShowsPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-tvShows';

  const PopularTvShowsPage({Key? key}) : super(key: key);

  @override
  State<PopularTvShowsPage> createState() => _PopularTvShowsPageState();
}

class _PopularTvShowsPageState extends State<PopularTvShowsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<PopularTvShowBloc>().add(FetchPopularTvShow());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularTvShowBloc, PopularTvShowState>(
          builder: (context, data) {
            if (data is PopularLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data is PopularHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvShows = data.tvShows[index];
                  return TvShowCard(tvShows);
                },
                itemCount: data.tvShows.length,
              );
            } else if (data is PopularError) {
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
