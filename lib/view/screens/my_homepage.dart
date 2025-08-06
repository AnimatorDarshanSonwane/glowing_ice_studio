import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/providers/testimonial_data.dart';
import 'package:glowing_ice_studio/view/widgets/buttons/checkout_more_button.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/about_us_scroll.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/auto_scrolling_logo_banner.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/casestudies/case_studies_header_widget.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/casestudies/portfolio_widget.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/client_testimonial_section.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/feature_cards_widget.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/featurecard/feature_grid_widget.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/game_development_section.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/gameportfolio/game_portfolio_grid_widget.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/gameportfolio/game_portfolio_titile_widget.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/homepage_bottom_text.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/homepage_middle_text.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/services_section.dart';
import 'package:glowing_ice_studio/view/widgets/homepage/statcard/statrow_widget.dart';
import 'package:glowing_ice_studio/view/widgets/top_appbar_widget.dart';
import 'package:glowing_ice_studio/viewmodel/feature_cards_view_model.dart';
import 'package:provider/provider.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

// import '../../viewmodel/item_list_view_model.dart';
// import '../../data/models/item_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  double _backgroundOpacity = 0.2;

  // final ItemListViewModel _viewModel = ItemListViewModel();
  //late List<ItemModel> _items;

  @override
  void initState() {
    super.initState();

    //_items = _viewModel.getItems();

    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      double newOpacity = (offset / 100).clamp(0.2, 1.0);

      if (newOpacity != _backgroundOpacity) {
        setState(() {
          _backgroundOpacity = newOpacity;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Scrollable content: image + list
          WebSmoothScroll(
            scrollSpeed: 2,
            scrollAnimationLength: 1500,
            curve: Curves.linearToEaseOut,
            controller: _scrollController,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _scrollController,
              //physics: const ClampingScrollPhysics(), // Smooth scrolling
              child: Column(
                children: [
                  // Fullscreen image
                  // Fullscreen image with overlay text
                  SizedBox(
                    height: screenHeight,
                    width: double.infinity,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'lib/assets/images/logo_01.png',
                          fit: BoxFit.cover,
                        ),
                        HomePageMiddleText(),
                        HomepageBottomText(),
                      ],
                    ),
                  ),

                  // List of items
                  // ..._items.map((item) {
                  //   return Container(
                  //     margin: const EdgeInsets.all(12),
                  //     padding: const EdgeInsets.all(20),
                  //     color: Colors.grey[300],
                  //     child: Text(item.title),
                  //   );
                  // }),

                  // Auto-scrolling logo banner
                  AutoScrollingLogoBanner(),
                  ServicesSection(),
                  GameDevelopmentSection(),

                  SizedBox(height: 50),

                  // Client testimonial section
                  ChangeNotifierProvider(
                    create: (_) => TestimonialData(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 400,
                        vertical: 20,
                      ),
                      child: ClientTestimonialSection(),
                    ),
                  ),
                  SizedBox(height: 100),

                  // Feature cards section
                  ChangeNotifierProvider(
                    create: (_) => FeatureCardsViewModel(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 20,
                      ),
                      child: FeatureCardsWidget(),
                    ),
                  ),

                  //about us section
                  const AboutUsHeading(),

                  //Center(
                  LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40.0),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 1000,
                                // maxHeight will still constrain overall grid
                                maxHeight: constraints.maxHeight,
                              ),
                              child: const FeatureGrid(),
                            ),
                          );
                        },
                  ),

                  // Stat Row Widget
                  const StatsRow(),

                  // Game Portfolio Title Section
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      const GamePortfolioTitle(),
                      const SizedBox(height: 20),
                      
                      // Other widgets like portfolio grid, etc.
                      Container(
                        // add left and right padding to center the grid
                        padding: const EdgeInsets.symmetric(horizontal: 400),
                        child: const GamePortfolioGrid(),
                      ),
                      const SizedBox(height: 40),

                      //Checkout More Button
                      Center(child: const CheckoutMoreButton()),
                      const SizedBox(height: 40),  
                    ],
                  ),

                  // Case Studies Header
                  const SizedBox(height: 40),
                  const CaseStudiesHeader(),
                  const SizedBox(height: 20),
                  // Portfolio Widget
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 400),
                    child: const PortfolioWidget()),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Sticky Top AppBar
          SafeArea(
            child: TopAppBarWidget(backgroundOpacity: _backgroundOpacity),
          ),
        ],
      ),
    );
  }
}
