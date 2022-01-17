import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:movie_review_app/api_data/api/movieapi.dart';
import 'package:movie_review_app/model/response/movie_detail.dart';
import 'package:movie_review_app/util/constants.dart';
import 'package:movie_review_app/util/services.dart';
import 'package:movie_review_app/widget/movie_card.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class MoviesForServiceScreen extends StatefulWidget {
  final ServiceName serviceName;
  const MoviesForServiceScreen({Key? key, required this.serviceName}) : super(key: key);

  @override
  State<MoviesForServiceScreen> createState() => _MoviesForServiceScreenState();
}

class _MoviesForServiceScreenState extends State<MoviesForServiceScreen> {
  final moviesIN = RM.inject<List<MovieDetail>>(() => []);
  int pageNo = 0;

  void getInTheaterMovies() {
    pageNo += 1;
    moviesIN.setState((s) async {
      final inTheaterMoviesResp = await movieService.getMoviesForService(pageNo, widget.serviceName);
      if (inTheaterMoviesResp.success && inTheaterMoviesResp.data != null) {
        if (widget.serviceName != ServiceName.upcoming) {
          s.addAll(inTheaterMoviesResp.data!.results!);
        } else {
          s.addAll(inTheaterMoviesResp.data!.results!.where((element) => element.releaseDateTime.isAfter(inTheaterMoviesResp.data!.dates!.minimumDate)));
        }
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
            listenTo: moviesIN,
            sideEffects: SideEffects(initState: getInTheaterMovies),
            builder: () {
              if (moviesIN.isWaiting && pageNo < 1) return progressBar;
              return Column(
                children: [
                  Expanded(
                    child: LazyLoadScrollView(
                      child: ListView.builder(
                        itemCount: moviesIN.state.length,
                        itemBuilder: (ctx, int index) {
                          return MovieCard(movieDetail: moviesIN.state[index]);
                        },
                      ),
                      onEndOfPage: getInTheaterMovies,
                    ),
                  ),
                  const SizedBox(height: 15),
                  if (moviesIN.isWaiting && pageNo > 1) progressBar,
                ],
              );
            }),
      ),
    );
  }
}
