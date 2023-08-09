import 'package:flutter/cupertino.dart';

class Level {
  final String titleLevel;
final String description ;
  final IconData? icon;

  final String? imageUrl;

  final List<Color>? colors;

  final String routeName;

  Level({
    required this.titleLevel,
    this.icon,
    this.imageUrl,
    this.colors,
    required this.routeName,
    required this.description ,
  });
}
