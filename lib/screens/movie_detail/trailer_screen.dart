// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/blocs/trailer_bloc.dart';

class TrailerScreen extends StatefulWidget {
  final int movieId;

  const TrailerScreen({Key key, this.movieId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return null;
  }
}

class TrailerScreenState extends State<TrailerScreen> {
  TrailerBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = TrailerBloc();
    bloc.getMovieTrailers(widget.movieId);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}