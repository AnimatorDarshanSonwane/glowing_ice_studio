import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF10121C),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side text and links
              Flexible(
              child: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: <Widget>[
                const Text(
                  'COPYRIGHT © 2025 JUEGO STUDIOS PRIVATE LIMITED',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const _FooterLink('PRIVACY POLICY'),
                const _FooterLink('TERMS & CONDITIONS'),
                const _FooterLink('REFUND POLICY'),
                const _FooterLink('PRIVACY POLICY PRODUCT'),
                const _FooterLink('SECURITY'),
                const _FooterLink('SITEMAP'),
                ],
              ),
              ),

              // Right side social icons using FontAwesome
              Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _SocialIcon(
                icon: FontAwesomeIcons.cross,
                ),
                _SocialIcon(
                icon: FontAwesomeIcons.twitter,
                ),
                _SocialIcon(
                icon: FontAwesomeIcons.skype,
                ),
                _SocialIcon(
                icon: FontAwesomeIcons.youtube,
                ),
                _SocialIcon(
                icon: FontAwesomeIcons.linkedinIn,
                ),
                _SocialIcon(
                icon: FontAwesomeIcons.behance,
                ),
                _SocialIcon(
                icon: FontAwesomeIcons.dribbble,
                ),
              ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  const _FooterLink(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      '| $text',
      style: const TextStyle(color: Colors.cyanAccent, fontSize: 12),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  const _SocialIcon({required this.icon});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: FaIcon(icon, color: Colors.white, size: 20),
    );
  }
}
