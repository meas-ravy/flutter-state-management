import 'package:flutter/material.dart';
import 'package:flutter_journey/provider/shop_cart/cart_provider.dart';
import 'package:provider/provider.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),

      body: cart.items.isEmpty
          ? Center(child: Text('Cart is Empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(cart.items[index]),
                      trailing: IconButton(
                        onPressed: () => context
                            .read<CartProvider>()
                            .removeItem(cart.items[index]),
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Total Item: ${cart.totalCart}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () =>
                            context.read<CartProvider>().clearCart(),
                        child: Text("Clear Cart"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
