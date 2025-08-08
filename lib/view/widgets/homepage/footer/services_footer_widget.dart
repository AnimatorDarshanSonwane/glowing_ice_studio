import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/footer/our_office_section.dart';

/// A widget that displays text and changes its color when hovered.
class HoverableText extends StatefulWidget {
  final String text;
  final TextStyle defaultStyle;
  final TextStyle hoverStyle;

  const HoverableText({
    super.key,
    required this.text,
    required this.defaultStyle,
    required this.hoverStyle,
  });

  @override
  State<HoverableText> createState() => _HoverableTextState();
}

class _HoverableTextState extends State<HoverableText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEvent details) => setState(() => _isHovered = true),
      onExit: (PointerEvent details) => setState(() => _isHovered = false),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: Text(
          widget.text,
          style: _isHovered ? widget.hoverStyle : widget.defaultStyle,
        ),
      ),
    );
  }
}

class ServicesFooterWidget extends StatelessWidget {
  const ServicesFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle headingStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: Colors.white,
    );

    TextStyle subheadingStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: Color(0xFFFFB700), // golden color
    );

    TextStyle itemStyle = const TextStyle(fontSize: 13, color: Colors.white70);
    TextStyle hoveredItemStyle = const TextStyle(
      fontSize: 13,
      color: Colors.blue,
    ); // Blue color for hover effect

    // Approximated height of a 14pt text line. Used for consistent vertical alignment.
    // This value is an estimate to visually align columns that don't have a primary heading
    // with columns that do, taking into account the primary heading's height and its
    // subsequent spacing.
    const double _approxPrimaryHeadingPlusSpacing =
        38.0; // Estimate: 14pt text height (~18px) + 20px explicit spacing

    Widget buildColumn(
      String heading,
      String subHeading,
      List<String> items, {
      bool isGold = false,
    }) {
      return Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (heading
                .isNotEmpty) // Renders the primary heading (e.g., "SERVICES")
              Text(heading, style: isGold ? headingStyle : itemStyle),
            if (heading.isNotEmpty) ...[
              // If a primary heading is present, add spacing before the subheading.
              const SizedBox(height: 10),
              const SizedBox(height: 10),
            ],
            // If heading is empty (e.g., for "RESOURCES"), the subHeading text
            // will start directly at the top, aligning with explicit headings.
            Text(subHeading, style: isGold ? subheadingStyle : headingStyle),
            const SizedBox(height: 10), // Space after the subheading
            for (String item in items)
              HoverableText(
                text: item,
                defaultStyle: itemStyle,
                hoverStyle: hoveredItemStyle,
              ),
          ],
        ),
      );
    }

    return Container(
      color: const Color(0xFF10121C), // background color from image
      // Padding around the footer content responsive to screen size
      // (assuming a 400px width)
      // (if the screen is wider, the padding will be smaller)
      alignment: Alignment.center,

      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.2, vertical: 40),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        buildColumn(
                          "SERVICES",
                          "Game Development Services",
                          <String>[
                            "Game Co Development",
                            "Mobile Game Development",
                            "PC Game Development",
                            "Unity3D Game Development",
                            "Unreal Game Development",
                            "Console Game Development",
                            "Game LiveOps Services",
                            "Game Testing",
                            "Web3 Game Development",
                            "NFT Game Development",
                            "Blockchain Game Development",
                            "HTML5/WebGL Game Development",
                            "P2E Game Development",
                            "RPG Game Development",
                            "Battle Royale Game Development",
                            "VR Game Development",
                          ],
                          isGold: true,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Adjusted space above Game Art Services to align horizontally with
                        // "Game Development Services" which is preceded by "SERVICES" heading and spacing.
                        const SizedBox(height: _approxPrimaryHeadingPlusSpacing),
                        buildColumn("", "Game Art Services", <String>[
                          "3D Game Art",
                          "AAA Game Art",
                          "Character Design",
                          "Environment Design",
                          "3D Modeling",
                          "3D Character Design",
                          "Slot Game Art",
                          "Casual Game Art",
                          "3D Animation",
                          "Asset Production",
                          "UI/UX",
                        ], isGold: true),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Adjusted space above Resource Augmentation to align horizontally with
                        // "Game Development Services" which is preceded by "SERVICES" heading and spacing.
                        const SizedBox(height: _approxPrimaryHeadingPlusSpacing),
                        buildColumn("", "Resource Augmentation", <String>[
                          "Hire Game Developers",
                          "Hire Game Designers",
                          "Hire 2D Artists",
                          "Hire 3D Artists",
                          "Hire UI UX Designers",
                          "Hire 2D Animator",
                          "Hire 3D Animator",
                        ], isGold: true),
                        const SizedBox(
                          height: 20,
                        ), // Spacing between the two stacked columns
                        buildColumn("", "VR/XR Simulation", <String>[
                          "VR Solutions",
                          "Simulations",
                          "Learning and Education",
                          "Metaverse Services",
                        ], isGold: true),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Added space above RESOURCES to align horizontally with
                        // "Game Development Services" which is preceded by "SERVICES" heading and spacing.
                        //const SizedBox(height: _approxPrimaryHeadingPlusSpacing),
                        buildColumn("", "RESOURCES", <String>[
                          "Press Release",
                          "Blog",
                          "FAQ",
                          "Process",
                          "Career",
                        ]),
                        const SizedBox(
                          height: 20,
                        ), // Spacing between the two stacked columns
                        buildColumn("", "OUR PORTFOLIOS", <String>[
                          "Games",
                          "Art & Design",
                          "Kid Games",
                          "Enterprise Apps",
                          "VR & Simulation",
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
           
          
            ],
            
          ),
          // container for footer
                  const OurOfficesSection()
        ],
      ),
      
    );
  }
}