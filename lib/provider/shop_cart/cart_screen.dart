import 'package:flutter/material.dart';
import 'package:flutter_journey/provider/shop_cart/cart_list_screen.dart';
import 'package:flutter_journey/provider/shop_cart/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> products = ['Apple 🍎', 'Banana 🍌', 'Orange 🍊'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CartListScreen()),
                  );
                },
              ),

              Positioned(
                right: 4,
                top: 4,
                child: Consumer<CartProvider>(
                  builder: (context, cart, _) {
                    if (cart.totalCart == 0) return SizedBox();
                    return CircleAvatar(
                      radius: 9,
                      backgroundColor: Colors.red,
                      child: Text(
                        '${cart.totalCart}',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
            trailing: ElevatedButton(
              onPressed: () =>
                  context.read<CartProvider>().addItem(products[index]),
              child: Text('Add to cart'),
            ),
          );
        },
      ),
    );
  }
}
