// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'base_model.dart';

class Trailer extends BaseModel {
  int id;
  List<Result> results;

  Trailer(Map<String, dynamic> data) {
    this.id = data['id'];
    for (int i = 0; i < data['results'].length; i++) {
      this.results.add(Result(data['results'][i]));
    }
  }
}

class Result {
  String id;
  String iso_639_1;
  String iso_3166_1;
  String key;
  String name;
  int site;
  String type;

  Result(Map<String, dynamic> data) {
    this.id = data['id'];
    this.iso_639_1 = data['iso_639_1'];
    this.iso_3166_1 = data['iso_3166_1'];
    this.key = data['key'];
    this.name = data['name'];
    this.site = data['site'];
    this.type = data['type'];
  }
}
