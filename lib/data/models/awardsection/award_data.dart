import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/data/models/awardsection/clientlogo_data.dart';

/// ChangeNotifier that holds the data for awards and client logos.
class AwardsData extends ChangeNotifier {
  final List<ClientLogo> _clientLogos;

  static String get _placeholderImageUrl => 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg';

  AwardsData()
    : _clientLogos = <ClientLogo>[
        ClientLogo(imageUrl: _placeholderImageUrl, name: 'Client A'),
        ClientLogo(imageUrl: _placeholderImageUrl, name: 'Client B'),
        ClientLogo(imageUrl: _placeholderImageUrl, name: 'Client C'),
        ClientLogo(imageUrl: _placeholderImageUrl, name: 'Client D'),
        ClientLogo(imageUrl: _placeholderImageUrl, name: 'Client E'),
        ClientLogo(imageUrl: _placeholderImageUrl, name: 'Client F'),
        ClientLogo(imageUrl: _placeholderImageUrl, name: 'Client G'),
      ];

  List<ClientLogo> get clientLogos =>
      List<ClientLogo>.unmodifiable(_clientLogos);
}