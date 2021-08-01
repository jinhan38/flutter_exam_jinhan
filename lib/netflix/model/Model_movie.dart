import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:core';

class Model_movie {
  late final String title;

  late final String keyword;
  late final String poster;
  late final bool like;

  Model_movie.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    keyword = map['keyword'];
    poster = map['poster'];
    like = map['like'];
  }

  @override
  String toString() => "Movie<$title:$keyword>";

}
