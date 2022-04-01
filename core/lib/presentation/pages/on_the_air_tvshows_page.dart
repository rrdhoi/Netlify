import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../widgets/tvshow_card_list.dart';

class OnTheAirTvShowsPage extends StatefulWidget {
  static const ROUTE_NAME = '/on-the-air-tvShows';
  const OnTheAirTvShowsPage({Key? key}) : super(key: key);

  @override
  State<OnTheAirTvShowsPage> createState() => _OnTheAirTvShowsPageState();
}

class _OnTheAirTvShowsPageState extends State<OnTheAirTvShowsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<OnTheAirTvShowBloc>().add(FetchOnTheAirTvShow()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('On The Air'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<OnTheAirTvShowBloc, OnTheAirTvShowState>(
          builder: (context, data) {
            if (data is OnTheAirTvShowLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data is OnTheAirTvShowHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvShows = data.tvShows[index];
                  return TvShowCard(tvShows);
                },
                itemCount: data.tvShows.length,
              );
            } else if (data is OnTheAirTvShowError) {
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
