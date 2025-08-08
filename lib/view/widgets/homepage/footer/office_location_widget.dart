import 'package:flutter/material.dart';

/// Data model for an individual office location within a city.
class OfficeLocation {
  final String city;
  final List<String> address;
  final String phone;
  final String email;

  const OfficeLocation({
    required this.city,
    required this.address,
    required this.phone,
    required this.email,
  });
}

/// Data model for a country, containing a list of its office locations.
class Country {
  final String name;
  final String flagEmoji;
  final List<OfficeLocation> locations;

  const Country({
    required this.name,
    required this.flagEmoji,
    required this.locations,
  });
}

/// Widget to display details of a single office location (city, address, phone, email).
class OfficeLocationDetail extends StatelessWidget {
  final OfficeLocation location;
  final TextStyle cityStyle;
  final TextStyle detailStyle;
  final TextStyle emailStyle;

  const OfficeLocationDetail({
    super.key,
    required this.location,
    required this.cityStyle,
    required this.detailStyle,
    required this.emailStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(location.city, style: cityStyle),
          // MouseRegion for address lines to change cursor to text (I-beam)
          MouseRegion(
            cursor: SystemMouseCursors.text,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: location.address
                  .map<Widget>((String line) => Text(line, style: detailStyle))
                  .toList(),
            ),
          ),
          const SizedBox(height: 4),
          if (location.phone.isNotEmpty) // Only show phone if available
            Row(
              children: <Widget>[
                const Icon(Icons.phone, size: 14, color: Colors.white60),
                const SizedBox(width: 5),
                Text(location.phone, style: detailStyle),
              ],
            ),
          if (location.email.isNotEmpty) // Only show email if available
            // MouseRegion for email to change cursor to click (hand)
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Row(
                children: <Widget>[
                  const Icon(Icons.email, size: 14, color: Colors.white60),
                  const SizedBox(width: 5),
                  Text(location.email, style: emailStyle),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Widget to display a country's offices, including country name, flag, and a list of locations.
class CountryOfficeCard extends StatelessWidget {
  final Country country;
  final TextStyle countryStyle;
  final TextStyle cityStyle;
  final TextStyle detailStyle;
  final TextStyle emailStyle;

  const CountryOfficeCard({
    super.key,
    required this.country,
    required this.countryStyle,
    required this.cityStyle,
    required this.detailStyle,
    required this.emailStyle,
  });

  @override
  Widget build(BuildContext context) {
    // Each column has a fixed width to ensure consistent layout in Wrap.
    // Adjust width as needed for content and responsiveness.
    const double columnWidth = 280.0;

    return SizedBox(
      width: columnWidth,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${country.name} ${country.flagEmoji}', style: countryStyle),
            const SizedBox(height: 10),
            ...country.locations.map<Widget>(
              (OfficeLocation location) => OfficeLocationDetail(
                location: location,
                cityStyle: cityStyle,
                detailStyle: detailStyle,
                emailStyle: emailStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The main widget for displaying all office locations.
class OfficeLocationsWidget extends StatelessWidget {
  const OfficeLocationsWidget({super.key});

  /// Static data for all countries and their office locations.
  static const List<Country> _countries = <Country>[
    Country(
      name: "INDIA",
      flagEmoji: "🇮🇳",
      locations: <OfficeLocation>[
        OfficeLocation(
          city: "Bangalore",
          address: <String>[
            "GR Grand Plaza, 2nd Floor, JP Nagar",
            "6th Phase, Bangalore - 560 078",
          ],
          phone: "+91 89298-08414",
          email: "info@jugostudio.com",
        ),
        OfficeLocation(
          city: "Mangalore",
          address: <String>[
            "D.No. 1-N-5-391/65,",
            "Bhandary Heights, Derebail Village",
            "Mangalore Taluk - 575006",
          ],
          phone: "",
          email: "",
        ),
      ],
    ),
    Country(
      name: "USA",
      flagEmoji: "🇺🇸",
      locations: <OfficeLocation>[
        OfficeLocation(
          city: "Texas",
          address: <String>[
            "Epic Suites 4740 14th ST. suite T3,",
            "Plano, TX 75074",
          ],
          phone: "",
          email: "",
        ),
        OfficeLocation(
          city: "Miami",
          address: <String>[
            "1000 Island BLVD, #1806, Aventura",
            "Florida - 33160",
          ],
          phone: "+1 (940)-2185249",
          email: "info.usa@jugostudio.com",
        ),
      ],
    ),
    Country(
      name: "UK",
      flagEmoji: "🇬🇧",
      locations: <OfficeLocation>[
        OfficeLocation(
          city: "London",
          address: <String>["#152, City Road EC1V 2NX"],
          phone: "+44 75 8784 0496",
          email: "info.uk@jugostudio.com",
        ),
      ],
    ),
    Country(
      name: "KSA",
      flagEmoji: "🇸🇦",
      locations: <OfficeLocation>[
        OfficeLocation(
          city: "Jeddah",
          address: <String>[
            "St Idris Square, 4036 Helmi Koutbi,",
            "Al Zahra, Jeddah 23425, Saudi Arabia",
          ],
          phone: "+966 50 259 7450",
          email: "info@jugostudio.com",
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Define text styles for consistency and easy modification.
    const TextStyle headingStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.white,
    );

    const TextStyle countryStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: Color(0xFFFFB700), // golden-orange
    );

    const TextStyle cityStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 13,
      color: Colors.orange,
    );

    const TextStyle detailStyle = TextStyle(
      fontSize: 13,
      color: Colors.white70,
    );

    const TextStyle emailStyle = TextStyle(
      fontSize: 13,
      color: Colors.cyanAccent,
    );

    return Container(
      color: const Color(0xFF0C0C14),
      padding: const EdgeInsets.symmetric(
        horizontal: 400.0,
        vertical: 30.0,
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("OUR OFFICES", style: headingStyle),
          const Divider(color: Colors.white38),
          const SizedBox(height: 20),
          Expanded(
            // Ensures the content below the title takes available vertical space
            child: SingleChildScrollView(
              // Allows vertical scrolling if content wraps and stacks
              child: Wrap(
                alignment: WrapAlignment.start,
                // The spacing is handled by the padding within CountryOfficeCard
                spacing: 0.0,
                runSpacing: 0.0,
                children: _countries
                    .map<Widget>(
                      (Country country) => CountryOfficeCard(
                        country: country,
                        countryStyle: countryStyle,
                        cityStyle: cityStyle,
                        detailStyle: detailStyle,
                        emailStyle: emailStyle,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
