import 'package:flutter/material.dart';

class FeatureCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final Border customBorder;

  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.customBorder,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: _isHovered
              ? <BoxShadow>[
                  const BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 20,
                    blurRadius: 30,
                    offset: Offset.zero,
                  ),
                ]
              : <BoxShadow>[],
          borderRadius: _isHovered
              ? BorderRadius.circular(5)
              : BorderRadius.zero,
          border: _isHovered
              ? null
              : widget
                    .customBorder, // Apply the custom border or disable on hover
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    widget.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
