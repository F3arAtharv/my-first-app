import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};
  bool _loaded = false;

  Map<String, CartItem> get items => _items;
  int get itemCount => _items.length;
  int get totalQuantity => _items.values.fold(0, (sum, i) => sum + i.quantity);
  double get totalAmount => _items.values.fold(0.0, (sum, i) => sum + i.total);

  Future<void> load() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('cart') ?? '[]';
    final list = (jsonDecode(raw) as List).cast<Map<String, dynamic>>();
    _items.clear();
    for (final m in list) {
      final item = CartItem.fromJson(m);
      _items[item.product.id] = item;
    }
    _loaded = true;
    notifyListeners();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final list = _items.values.map((e) => e.toJson()).toList();
    await prefs.setString('cart', jsonEncode(list));
  }

  Future<void> add(Product p) async {
    if (_items.containsKey(p.id)) {
      _items[p.id]!.quantity += 1;
    } else {
      _items[p.id] = CartItem(product: p, quantity: 1);
    }
    await _save();
    notifyListeners();
  }

  Future<void> remove(String productId) async {
    _items.remove(productId);
    await _save();
    notifyListeners();
  }

  Future<void> changeQty(String productId, int qty) async {
    if (!_items.containsKey(productId)) return;
    if (qty <= 0) {
      _items.remove(productId);
    } else {
      _items[productId]!.quantity = qty;
    }
    await _save();
    notifyListeners();
  }

  Future<void> clear() async {
    _items.clear();
    await _save();
    notifyListeners();
  }
}
