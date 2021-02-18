import 'package:flutter/material.dart';

class User {
  final String id;
  final String title;
  final String imageUrl;

  const User({
    @required this.id,
    @required this.title,
    this.imageUrl,
  });
}
