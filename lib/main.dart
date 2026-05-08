import 'package:flutter/material.dart';
import 'package:flutter_journey/provider/dark_mode/theme_provider.dart';
import 'package:flutter_journey/provider/shop_cart/cart_provider.dart';
import 'package:flutter_journey/provider/shop_cart/cart_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeProvider.currTheme,
      home: const CartScreen(),
    );
  }
}
