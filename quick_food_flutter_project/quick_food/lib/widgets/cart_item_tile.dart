import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;
  final VoidCallback onRemove;
  final ValueChanged<int> onQtyChanged;
  const CartItemTile({super.key, required this.item, required this.onRemove, required this.onQtyChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text(item.product.image, style: const TextStyle(fontSize: 28)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.product.name, style: Theme.of(context).textTheme.titleMedium),
                  Text("₹${item.product.price.toStringAsFixed(2)} each"),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(onPressed: () => onQtyChanged(item.quantity - 1), icon: const Icon(Icons.remove)),
                Text(item.quantity.toString()),
                IconButton(onPressed: () => onQtyChanged(item.quantity + 1), icon: const Icon(Icons.add)),
              ],
            ),
            IconButton(onPressed: onRemove, icon: const Icon(Icons.delete_outline)),
          ],
        ),
      ),
    );
  }
}
