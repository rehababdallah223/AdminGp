import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String imageUrl;
  final int rate;

   User({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.rate,
  });

}