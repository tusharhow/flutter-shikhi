import 'package:flutter/material.dart';

class PostModel {
  final int id;
  final String title;
  final String subtitle;
  final String desc1;
  final String desc2;
  final String desc3;
  final String desc4;
  final String desc5;
  final String desc6;
  final String code;
  final Widget preview;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String image5;

  PostModel({
    required this.desc2,
    required this.desc3,
    required this.desc4,
    required this.desc5,
    required this.desc6,
    required this.code,
    required this.preview,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.desc1,
  });
}
