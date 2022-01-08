import 'package:flutter/material.dart';
import 'package:movie_review_app/screens/home/movies_in_theater.dart';
import 'package:movie_review_app/screens/home/popular_movies_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final List<Tab> tabs;
  late final TabController _tabController;
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    tabs = const [
      Tab(
        text: "Popular Movies",
      ),
      Tab(
        text: "In Theaters",
      ),
      Tab(
        text: "Upcoming",
      ),
      Tab(
        text: "Top Rated",
      )
    ];
    _tabController = TabController(length: tabs.length, vsync: this);
    screens = [const PopularMoviesScreen(), const InTheaterMovies(), Container(), Container()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies", style: TextStyle(fontSize: 40)),
      ),
      body: Column(
        children: [
          TabBar(
            labelStyle: const TextStyle(fontSize: 24),
            indicatorWeight: 4,
            tabs: tabs,
            controller: _tabController,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.purple,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: screens,
            ),
          ),
        ],
      ),
    );
  }
}
