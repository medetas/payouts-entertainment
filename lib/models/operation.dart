import 'package:flutter/material.dart';

class Operation {
  final String id;
  final String title;
  final String icon;
  final String imageUrl;

  const Operation({
    @required this.id,
    @required this.title,
    this.icon,
    this.imageUrl,
  });
}
