// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/model/models.dart';
import 'package:flutter_moviehub/widgets/items/movie_item_view.dart';
import 'package:flutter_moviehub/widgets/items/shimmer/movie_item_shimmer_view.dart';

class MovieListView extends StatelessWidget {
  final AsyncSnapshot<MovieList> sMovies;

  MovieListView({Key key, this.sMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (sMovies.hasData) {
      // Populate list view with the data
      return _buildListView(context, sMovies.data);
    } else if (sMovies.hasError) {
      // Display loading indicator
      return Center(child: Text(sMovies.error.toString()));
    }
    // Display shimmer loading view
    return _buildShimmerListView(context);
  }

  Widget _buildListView(BuildContext context, MovieList movies) {
    final rootWidth = MediaQuery.of(context).size.width;
    return Container(
      height: rootWidth / 1.75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.results.length,
        itemBuilder: (BuildContext context, int index) {
          return buildMovieItemView(context, movies.results[index]);
        },
      ),
    );
  }

  Widget _buildShimmerListView(BuildContext context) {
    final rootWidth = MediaQuery.of(context).size.width;
    return Container(
      height: rootWidth / 1.75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return buildMovieShimmerItemView();
        },
      ),
    );
  }
}
