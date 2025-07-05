import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'WE OFFER',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              letterSpacing: 5,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'HOST OF COMPREHENSIVE',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w900,
              color: Color(0xFF2E333B), // Dark grey
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'SERVICES',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w900,
              color: Color(0xFFFFA500), // Orange
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 400),
            child: Text(
              'Glowing Ice Studios is a top-notch external game development partner, delivering exceptional and tailored services to meet the unique needs of every project. Specializing in full cycle game development and co-development, our skilled and versatile team excels in executing diverse projects with precision and creativity. We are your ideal partner for bringing innovative gaming ideas to life across platforms.',
              style: TextStyle(
                fontSize: 14,
                height: 1.6,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
