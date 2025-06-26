import 'package:flutter/material.dart';

class HiringBadge extends StatefulWidget {
  const HiringBadge({super.key});

  @override
  State<HiringBadge> createState() => _HiringBadgeState();
}

class _HiringBadgeState extends State<HiringBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _isHovered ? 0.5 : 1.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orange[800],
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                "We're Hiring!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomPaint(
              size: const Size(12, 6),
              painter: TrianglePainter(color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color? color;
  TrianglePainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color ?? Colors.orange;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
