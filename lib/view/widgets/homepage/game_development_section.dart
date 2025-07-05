import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/view/widgets/buttons/checkout_more_button.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/auto_scroll_carousel.dart';

class GameDevelopmentSection extends StatelessWidget {
  const GameDevelopmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          // Main Blue Box with rounded corner
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF1D9CEB),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left content
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gamepad Icon + Title
                      Row(
                        children: const [
                          Icon(
                            Icons.sports_esports,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'GAME DEVELOPMENT',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),

                      // Description Text
                      const Text(
                        'Our game development studio specializes in RPGs, MMORPGs, Casual, and more, offering full-cycle development, multi-platform and cross-platform solutions, co-development, and LiveOps support to deliver exceptional, high-quality games tailored to your needs.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Wrap in a container to control width
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 600,
                        ), // Adjust width as needed
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 16,
                          //alignment: WrapAlignment.start,
                          children: const [
                            GameDevButton(text: 'Mobile Game Development'),
                            GameDevButton(text: 'Unity 3D Game Development'),
                            GameDevButton(text: 'Unreal Game Development'),
                            GameDevButton(text: 'HTML5 Game Development'),
                            GameDevButton(text: 'PC Game Development'),
                            GameDevButton(text: 'VR Game Development'),
                            GameDevButton(text: 'Game LiveOps Services'),
                            GameDevButton(text: 'Game Co Development'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                      // View More
                      Row(
                        children: const [
                          Text(
                            'VIEW MORE',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.double_arrow,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 20),

                // Right image (character)
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/character.jpg',
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Related Portfolio
          Container(
            // Add border radius to match the top section
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 99, 99, 99),
                width: 2.0, 
                
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
            ),
            
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'RELATED PORTFOLIO',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    Spacer(),
                    // Example usage of the CheckoutMoreButton
                    CheckoutMoreButton(),            
                  ],
                ),
                const SizedBox(height: 20),
                
                // Horizontal portfolio images (mocked)
                AutoScrollCarousel(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GameDevButton extends StatelessWidget {
  final String text;

  const GameDevButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260, // ~600/2 - spacing for 2 columns
      height: 45,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white, width: 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}


class PortfolioItem extends StatelessWidget {
  final String imagePath;

  const PortfolioItem({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Image.asset(imagePath, width: 120, fit: BoxFit.cover),
    );
  }
}
