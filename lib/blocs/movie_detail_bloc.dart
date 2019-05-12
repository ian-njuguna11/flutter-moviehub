// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_moviehub/blocs/base_bloc.dart';
import 'package:flutter_moviehub/model/models.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc extends BaseBloc {
  final _movieId = PublishSubject<int>();

  final _fetchMovie = PublishSubject<Movie>();
  Observable<Movie> get movieDetailStream => _fetchMovie.stream;

  final _fetchMovieTrailers = BehaviorSubject<Future<Trailer>>();
  Observable<Future<Trailer>> get movieTrailersStream => _fetchMovieTrailers.stream;

  MovieDetailBloc() {
    _movieId.stream.transform(_streamTransformer()).pipe(_fetchMovieTrailers);
  }

  @override
  dispose() async {
    super.dispose();
    _movieId.close();

    await _fetchMovie.drain();
    _fetchMovie.close();

    await _fetchMovieTrailers.drain();
    _fetchMovieTrailers.close();
  }

  _streamTransformer() {
    return ScanStreamTransformer(
        (Future<Trailer> trailer, int movieId, int index) {
      trailer = repository.getMovieTrailers(movieId);
      return trailer;
    });
  }

  // TODO: Convert similar to trailer id when usage is also mgirated
  getMovie(int movieId) async {
    Movie movie = await repository.getMovie(movieId);
    _fetchMovie.sink.add(movie);
  }

  getMovieTrailers(int movieId) async {
    _movieId.sink.add(movieId);
  }
}
