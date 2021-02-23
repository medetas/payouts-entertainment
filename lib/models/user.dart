import 'package:flutter/material.dart';

class User {
  final String id;
  final String title;
  final String imageUrl;
  final bool online;

  const User({
    @required this.id,
    @required this.title,
    this.imageUrl,
    @required this.online,
  });
}
