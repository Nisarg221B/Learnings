import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:project_7/data/categories.dart';
import 'package:project_7/models/grocery_item.dart';

class GroceryListNotifier extends StateNotifier<List<GroceryItem>> {
  GroceryListNotifier() : super([]) {
    loadItems();
  }

  final url = Uri.https(
      'flutter-prep-bffc3-default-rtdb.asia-southeast1.firebasedatabase.app',
      'shopping-list.json');

  Future<http.Response> loadItems() async {
    var response = await http.get(url);
    if (response.statusCode >= 400) {
      return response;
    }
    if (response.body == 'null') {
      state = [];
      return response;
    }

    final Map<String, dynamic> listdata = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];

    for (final item in listdata.entries) {
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;
      loadedItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        ),
      );
    }
    state = loadedItems;
    return response;
  }

  Future addItems(GroceryItem newItem) async {
    await http
        .post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'name': newItem.name,
          'quantity': newItem.quantity,
          'category': newItem.category.title,
        },
      ),
    )
        .then(
      (value) async {
        http.Response res = await loadItems();
        if (res.statusCode >= 400) {
          return res;
        }
        return value;
      },
    );
  }

  Future<bool> removeItem(GroceryItem item) async {
    var urlx = Uri.https(
        'flutter-prep-bffc3-default-rtdb.asia-southeast1.firebasedatabase.app',
        'shopping-list/${item.id}.json');
    var response = await http.delete(urlx);
    if (response.statusCode >= 400) {
      //optional : show error message
      return false;
    }

    await loadItems();
    return true;
  }
}

final groceryListProvider =
    StateNotifierProvider<GroceryListNotifier, List<GroceryItem>>((ref) {
  return GroceryListNotifier();
});

class IsloadingNotifier extends StateNotifier<bool> {
  IsloadingNotifier() : super(true);

  void setFalse() {
    state = false;
  }
}

final isloadingProvider = StateNotifierProvider<IsloadingNotifier, bool>(
    (ref) => IsloadingNotifier());
