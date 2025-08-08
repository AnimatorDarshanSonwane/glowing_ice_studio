import 'package:flutter/material.dart';

class OurOfficesSection extends StatelessWidget {
  const OurOfficesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF10121C), // Dark background
      padding: const EdgeInsets.symmetric(
       // horizontal: 400, // Adjust horizontal padding as needed
        vertical: 30.0, // Vertical padding for spacing
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'OUR OFFICES',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: const [
              OfficeCard(
                country: 'INDIA 🇮🇳',
                offices: [
                  OfficeLocation(
                    city: 'Bangalore',
                    address:
                        'GR Grand Plaza, 2nd Floor, JP Nagar\n6th Phase, Bangalore – 560 078',
                  ),
                  OfficeLocation(
                    city: 'Mangalore',
                    address:
                        'D.No. 1-N-5-391/56,\nBhandary Heights, Derebail Village\nMangalore Taluk – 575006',
                  ),
                ],
                phone: '+91 89298-08414',
                email: 'info@juegostudio.com',
              ),
              OfficeCard(
                country: 'USA 🇺🇸',
                offices: [
                  OfficeLocation(
                    city: 'Texas',
                    address:
                        'Epic Suites 4740 14th ST. suite T3,\nPlano, TX 75074',
                  ),
                  OfficeLocation(
                    city: 'Miami',
                    address:
                        '1000 Island BLVD, #1806, Aventura\nFlorida – 33160',
                  ),
                ],
                phone: '+1 (940)-2185249',
                email: 'info.usa@juegostudio.com',
              ),
              OfficeCard(
                country: 'UK 🇬🇧',
                offices: [
                  OfficeLocation(
                    city: 'London',
                    address: '#152, City Road EC1V 2NX',
                  ),
                ],
                phone: '+44 75 8784 0496',
                email: 'info.uk@juegostudio.com',
              ),
              OfficeCard(
                country: 'KSA 🇸🇦',
                offices: [
                  OfficeLocation(
                    city: 'Jeddah',
                    address:
                        'St Idris Square, 4036 Helmi Koutbi,\nAl Zahra, Jeddah 23425, Saudi Arabia',
                  ),
                ],
                phone: '+966 50 269 7450',
                email: 'info@juegostudio.com',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OfficeCard extends StatelessWidget {
  final String country;
  final List<OfficeLocation> offices;
  final String phone;
  final String email;

  const OfficeCard({
    super.key,
    required this.country,
    required this.offices,
    required this.phone,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161926),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            country,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          ...offices.map(
            (office) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    office.city,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    office.address,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.phone, size: 16, color: Colors.white70),
              const SizedBox(width: 8),
              Text(
                phone,
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.email, size: 16, color: Colors.white70),
              const SizedBox(width: 8),
              Text(
                email,
                style: const TextStyle(color: Colors.cyanAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OfficeLocation {
  final String city;
  final String address;

  const OfficeLocation({
    required this.city,
    required this.address,
  });
}
