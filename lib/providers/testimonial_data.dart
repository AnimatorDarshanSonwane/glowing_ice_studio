import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/data/models/testimonial.dart';


class TestimonialData extends ChangeNotifier {
  final List<Testimonial> _testimonials = [
    Testimonial(
      text:
          "It's safe to say that most regular human beings would be shocked and daunted at the idea of having to do a high quality game for iOS and Android, within a deadline of few months. I can honestly say that this work not the case with Juego Studios. They responded reactively, calmly and productively, and ended up delivering a game that both myself, the LatAm team, and users, were very happy with. There is a calm and experienced professionalism to the Juego team, and I would not hesitate to use them again.""It's safe to say that most regular human beings would be shocked and daunted at the idea of having to do a high quality game for iOS and Android, within a deadline of few months. I can honestly say that this work not the case with Juego Studios. They responded reactively, calmly and productively, and ended up delivering a game that both myself, the LatAm team, and users, were very happy with. There is a calm and experienced professionalism to the Juego team, and I would not hesitate to use them again.",
      author: 'Josh Saunders',
      designation: 'Senior Director,\nInnovation (Warner- Group)',
      imageUrl:
          'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    ),
    Testimonial(
      text:
          "Another excellent experience working with this team. Their dedication to quality and timely delivery is commendable. We achieved our project goals with ease, thanks to their expertise and proactive communication. Highly recommended!",
      author: 'Sarah Chen',
      designation: 'Marketing Director, Global Corp',
      imageUrl:
          'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    ),
    Testimonial(
      text:
          "The solutions provided were innovative and perfectly tailored to our needs. The team demonstrated profound understanding of our challenges and delivered a product that exceeded our expectations. A truly valuable partnership.",
      author: 'Michael Lee',
      designation: 'VP of Product, InnovateX',
      imageUrl:
          'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    ),
  ];

  int _currentIndex = 0;

  Testimonial get currentTestimonial => _testimonials[_currentIndex];

  void nextTestimonial() {
    if (_currentIndex < _testimonials.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previousTestimonial() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }
}
