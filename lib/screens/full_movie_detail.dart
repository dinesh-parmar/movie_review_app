import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_review_app/model/response/full_movie_detail.dart';
import 'package:movie_review_app/model/response/movie_detail.dart';
import 'package:movie_review_app/util/extensions.dart';
import 'package:movie_review_app/util/services.dart';
import 'package:movie_review_app/widget/platform_cached_network_image.dart';
import 'package:movie_review_app/widget/review_bar.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class FullMovieDetailScreen extends StatefulWidget {
  final MovieDetail movieDetail;

  const FullMovieDetailScreen({Key? key, required this.movieDetail}) : super(key: key);

  @override
  _FullMovieDetailScreenState createState() => _FullMovieDetailScreenState();
}

class _FullMovieDetailScreenState extends State<FullMovieDetailScreen> {
  final moviesDetailIN = RM.inject(() => FullMovieDetail());

  FullMovieDetail get _movie => moviesDetailIN.state;

  bool get _isWaiting => moviesDetailIN.isWaiting;

  void _getMovieDetails() {
    moviesDetailIN.setState((s) async {
      final movieResp = await movieService.getMovieDetails(widget.movieDetail.id!);
      if (movieResp.success && movieResp.data != null) {
        s = movieResp.data!;
      } else {
        movieResp.showErrorDialog();
      }
      return s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movie Detail"), centerTitle: true),
      body: LayoutBuilder(builder: (context, constraints) {
        return Child(
          builder: (child) {
            return OnBuilder(
              listenTo: moviesDetailIN,
              sideEffects: SideEffects(initState: _getMovieDetails),
              builder: () {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          child,
                          Flexible(
                            child: AnimatedSize(
                              alignment: Alignment.bottomCenter,
                              curve: Curves.easeInQuad,
                              duration: 200.milliseconds,
                              child: moviesDetailIN.isWaiting
                                  ? const SizedBox()
                                  : Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        _MoviePropertyCard(
                                          titleName: "Genre",
                                          icon: Icons.videocam,
                                          content: _movie.genres!.map((e) => e.name!).toList(),
                                        ),
                                        _MoviePropertyCard(
                                          titleName: "Duration",
                                          icon: Icons.watch_later,
                                          content: [(_movie.runtime ?? 0).getDuration()],
                                        ),
                                        _MoviePropertyCard(
                                          titleName: "Rating",
                                          icon: Icons.star,
                                          content: [(_movie.voteAverage.toString() + " / 10")],
                                        ),
                                      ],
                                    ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      AnimatedSize(
                        alignment: Alignment.bottomCenter,
                        curve: Curves.easeInQuad,
                        duration: 200.milliseconds,
                        child: _isWaiting
                            ? const SizedBox()
                            : Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      _movie.title!,
                                      style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 35),
                                    ),
                                    const SizedBox(height: 15),
                                    const Divider(color: Colors.grey),
                                    Text(
                                      _movie.overview!,
                                      style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.blueGrey.withOpacity(0.8)),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                      _isWaiting ? const SizedBox() : ReviewBar(movieId: _movie.id!),
                    ],
                  ),
                );
              },
            );
          },
          child: Hero(
            tag: widget.movieDetail.id.toString(),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.purple)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: PlatformCachedNetworkImage(
                  widget.movieDetail.posterPath!.getImageLink(300),
                  fit: BoxFit.scaleDown,
                  width: constraints.maxWidth * 0.6,
                  alignment: Alignment.topLeft,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _MoviePropertyCard extends StatefulWidget {
  const _MoviePropertyCard({
    Key? key,
    required this.titleName,
    required this.content,
    required this.icon,
  }) : super(key: key);
  final String titleName;
  final List<String> content;
  final IconData icon;

  @override
  State<_MoviePropertyCard> createState() => _MoviePropertyCardState();
}

class _MoviePropertyCardState extends State<_MoviePropertyCard> {
  int _currentIndex = 0;
  late final Timer? _timer;
  late final PageController _pageController = PageController(initialPage: _currentIndex);

  @override
  void initState() {
    super.initState();
    if (widget.content.length > 1) {
      _timer = Timer.periodic(2.seconds, (timer) {
        if (_currentIndex >= (widget.content.length - 1)) {
          _currentIndex = 0;
        } else {
          _currentIndex++;
        }
        _pageController.animateToPage(_currentIndex, duration: 300.milliseconds, curve: Curves.easeIn);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.white),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            child: Icon(
              widget.icon,
              size: 35,
              color: Colors.white,
            ),
            decoration: const BoxDecoration(
              color: Colors.transparent,
              gradient: RadialGradient(colors: [Colors.white12, Colors.white10], focalRadius: 40, radius: 40),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(widget.titleName, style: const TextStyle(fontSize: 15, color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 20,
              child: PageView.builder(
                itemCount: widget.content.length,
                controller: _pageController,
                itemBuilder: (ctx, index) => Text(
                  widget.content[index],
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
