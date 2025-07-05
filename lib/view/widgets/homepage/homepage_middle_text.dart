import 'package:flutter/material.dart';

class HomePageMiddleText extends StatelessWidget {
  const HomePageMiddleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 560), // Adjust margin to position text
      child: Center(
        // Fix the bottom overflow issue 
    child: LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(30.0),
          // Use min of available height or a max value to avoid overflow
          constraints: BoxConstraints(
            minHeight: 180,
            maxHeight: constraints.maxHeight > 350 ? 350 : constraints.maxHeight,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.blueGrey.withAlpha((255 * 0.8).round()),
                const Color.fromARGB(255, 255, 255, 255).withAlpha((255 * 0.0).round()),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'GLOWING ICE STUDIO,   WE MAKE IMAGINATION REALITY',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black.withAlpha((255 * 0.6).round()),
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  'We are a leading game development outsourcing studio whose expertise spans a myriad of domains such as Unity, Unreal, AI, AR/VR, Concept art, 3D modeling, animation, etc. With proven processes for L&D, PMS & ISMS in place, we consistently deliver high-quality results for our global clientele.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 228, 121, 0),
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black.withAlpha((255 * 0.6).round()),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    ),
      ),
    );
  }
}
