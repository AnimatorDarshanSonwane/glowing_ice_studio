import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/view/widgets/top_appbar_widget.dart';
import '../../viewmodel/item_list_view_model.dart';
import '../../data/models/item_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  double _backgroundOpacity = 0.2;

  final ItemListViewModel _viewModel = ItemListViewModel();
  late List<ItemModel> _items;

  @override
  void initState() {
    super.initState();

    _items = _viewModel.getItems();

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
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Fullscreen image
                SizedBox(
                  height: screenHeight,
                  width: double.infinity,
                  child: Image.asset(
                    'lib/assets/images/logo_01.png', // Replace with your image
                    fit: BoxFit.cover,
                  ),
                ),

                // List of items
                ..._items.map((item) {
                  return Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(20),
                    color: Colors.grey[300],
                    child: Text(item.title),
                  );
                }).toList(),
              ],
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
