import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:movie_review_app/gen/assets.gen.dart';
import 'package:movie_review_app/model/response/reviews_response.dart';
import 'package:movie_review_app/util/constants.dart';
import 'package:movie_review_app/util/extensions.dart';
import 'package:movie_review_app/util/services.dart';
import 'package:movie_review_app/widget/platform_cached_network_image.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ReviewBar extends StatefulWidget {
  ReviewBar({Key? key, required this.movieId}) : super(key: key);
  final int movieId;

  @override
  State<ReviewBar> createState() => _ReviewBarState();
}

class _ReviewBarState extends State<ReviewBar> {
  final reviewsList = <Review>[].inj();
  int currentPage = 1;

  void getReviews() {
    reviewsList.setState((s) async {
      final resp = await movieService.getReviews(widget.movieId, currentPage);
      if (resp.success && resp.data != null) {
        s.addAll(resp.data!.reviews!);
      } else {
        resp.showErrorDialog();
      }
      return s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OnBuilder(
        sideEffects: SideEffects(initState: getReviews),
        listenToMany: [reviewsList],
        builder: () {
          return reviewsList.state.isEmpty
              ? const SizedBox()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      child: Text("Reviews:", style: TextStyles.title.copyWith(fontSize: 25), textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: 200,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Expanded(
                            child: LazyLoadScrollView(
                              scrollDirection: Axis.horizontal,
                              child: ListView.builder(
                                itemCount: reviewsList.state.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext ctx, int index) {
                                  return Container(
                                    decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(8)),
                                    width: 300,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(height: 5),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                                child: ClipOval(
                                                  child: reviewsList.state[index].authorDetails?.avatarPath != null
                                                      ? PlatformCachedNetworkImage(
                                                          reviewsList.state[index].authorDetails?.avatarPath!.getImageLink(),
                                                          height: 40,
                                                          fit: BoxFit.scaleDown,
                                                        )
                                                      : Assets.images.profileimage.image(height: 30, fit: BoxFit.scaleDown),
                                                ),
                                              ),
                                              Text("⭐  ${reviewsList.state[index].authorDetails?.rating ?? "NA"} / 10", style: const TextStyle(fontSize: 20)),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          reviewsList.state[index].content ?? "",
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              onEndOfPage: () {
                                currentPage = currentPage + 1;
                                getReviews();
                              },
                            ),
                          ),
                          if (reviewsList.isWaiting && currentPage > 1) progressBar,
                        ],
                      ),
                    ),
                  ],
                );
        });
  }
}
