import '../data/models/item_model.dart';

class ItemListViewModel {
  // Simulating data fetch
  List<ItemModel> getItems() {
    return List.generate(
      25,
      (index) => ItemModel(title: 'Item $index'),
    );
  }
}
