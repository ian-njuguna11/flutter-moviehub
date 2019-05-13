// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_moviehub/model/trailer.dart';

class TrailerListView extends StatelessWidget {
  final AsyncSnapshot<Trailer> listItems;

  const TrailerListView({Key key, this.listItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Populate list view with the data
    if(listItems.hasData) {
      return _buildListView(context, listItems.data);
    }
    // Display loading indicator
    else if(listItems.hasError) {
      return Center(child: Text(listItems.error.toString()));
    }
    // Display shimmer loading view
    return _buildShimmerView(context);
  }

  Widget _buildListView(BuildContext context, Trailer trailer){ 
    return null;
  }

  Widget _buildShimmerView(BuildContext context) {
    return null;
  }
}