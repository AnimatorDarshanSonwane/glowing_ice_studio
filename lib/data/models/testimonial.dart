/// Represents a single client testimonial with all its details.
class Testimonial {
  final String text;
  final String author;
  final String designation;
  final String imageUrl; // URL for the client's logo/image

  Testimonial({
    required this.text,
    required this.author,
    required this.designation,
    required this.imageUrl,
  });
}