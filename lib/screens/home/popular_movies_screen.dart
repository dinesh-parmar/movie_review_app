// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:movie_review_app/model/response/movie_detail.dart';
import 'package:movie_review_app/util/constants.dart';
import 'package:movie_review_app/util/services.dart';
import 'package:movie_review_app/widget/movie_card.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class PopularMoviesScreen extends StatefulWidget {
  const PopularMoviesScreen({Key? key}) : super(key: key);

  @override
  State<PopularMoviesScreen> createState() => _PopularMoviesScreenState();
}

class _PopularMoviesScreenState extends State<PopularMoviesScreen> {
  final popularMoviesIN = RM.inject<List<MovieDetail>>(() => []);
  int pageNo = 0;

  void getPopularMovies() {
    pageNo += 1;
    popularMoviesIN.setState((s) async {
      final resp = await movieService.getPopularMovies(pageNo);
      if (resp.success && resp.data != null && resp.data!.results != null) {
        s.addAll(resp.data!.results!);
      } else {
        resp.showErrorDialog();
      }
      return s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 25),
        child: OnBuilder(
          listenTo: popularMoviesIN,
          sideEffects: SideEffects(initState: getPopularMovies),
          builder: () {
            if (popularMoviesIN.isWaiting && pageNo <= 1) {
              return progressBar;
            }
            return Column(
              children: [
                Expanded(
                  child: LazyLoadScrollView(
                    isLoading: popularMoviesIN.isWaiting,
                    onEndOfPage: getPopularMovies,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: popularMoviesIN.state.length,
                      itemBuilder: (ctx, int index) {
                        return SizedBox(height: 250, width: double.maxFinite, child: MovieCard(movieDetail: popularMoviesIN.state[index]));
                      },
                    ),
                  ),
                ),
                if (popularMoviesIN.isWaiting && pageNo > 1) progressBar
              ],
            );
          },
        ),
      ),
    );
  }
}
