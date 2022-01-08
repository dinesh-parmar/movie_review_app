import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:movie_review_app/model/response/movie_detail.dart';
import 'package:movie_review_app/util/constants.dart';
import 'package:movie_review_app/util/services.dart';
import 'package:movie_review_app/widget/movie_card.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class InTheaterMovies extends StatefulWidget {
  const InTheaterMovies({Key? key}) : super(key: key);

  @override
  State<InTheaterMovies> createState() => _InTheaterMoviesState();
}

class _InTheaterMoviesState extends State<InTheaterMovies> {
  final inTheaterMoviesIN = RM.inject<List<MovieDetail>>(() => []);
  int pageNo = 0;

  void getInTheaterMovies() {
    pageNo += 1;
    inTheaterMoviesIN.setState((s) async {
      final inTheaterMoviesResp = await movieService.getInTheaterMovies(pageNo);
      if (inTheaterMoviesResp.success && inTheaterMoviesResp.data != null) {
        s.addAll(inTheaterMoviesResp.data!.results!);
      } else {
        inTheaterMoviesResp.showErrorDialog();
      }
      return s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 20),
        child: OnBuilder(
            listenTo: inTheaterMoviesIN,
            sideEffects: SideEffects(initState: getInTheaterMovies),
            builder: () {
              if (inTheaterMoviesIN.isWaiting && pageNo < 1) return progressBar;
              return Column(
                children: [
                  Expanded(
                    child: LazyLoadScrollView(
                      child: ListView.builder(
                        itemCount: inTheaterMoviesIN.state.length,
                        itemBuilder: (ctx, int index) {
                          return MovieCard(movieDetail: inTheaterMoviesIN.state[index]);
                        },
                      ),
                      onEndOfPage: getInTheaterMovies,
                    ),
                  ),
                  const SizedBox(height: 15),
                  if (inTheaterMoviesIN.isWaiting && pageNo > 1) progressBar,
                ],
              );
            }),
      ),
    );
  }
}
