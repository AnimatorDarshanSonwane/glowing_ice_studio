// DATA_MODEL
import 'package:flutter/material.dart';

class FeatureItem {
  final String title;
  final String description;
  final String imageUrl;
  final Border customBorder;

  const FeatureItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.customBorder,
  });
}