import 'package:flutter/material.dart';
import 'package:flutter_journey/provider/dark_mode/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return Switch(
      value: themeProvider.isDarkMode,
      onChanged: (_) => context.read<ThemeProvider>().toggleTheme(),
    );
  }
}
