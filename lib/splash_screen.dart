// ignore_for_file: deprecated_member_use

import 'package:aladia/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  final bool isDarkMode;

  const SplashScreen({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return Switch(
                  activeColor: isDarkMode
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.1),
                  inactiveThumbColor: Colors.white.withOpacity(0.1),
                  thumbColor: MaterialStatePropertyAll(
                    isDarkMode
                        ? Colors.black.withOpacity(0.5)
                        : Colors.white.withOpacity(0.5),
                  ),
                  inactiveTrackColor: isDarkMode
                      ? Colors.black.withOpacity(0.5)
                      : Colors.black.withOpacity(0.3),
                  thumbIcon: MaterialStatePropertyAll(
                    themeProvider.isSelected
                        ? const Icon(Icons.nights_stay)
                        : const Icon(Icons.wb_sunny, color: Colors.white),
                  ),
                  value: themeProvider.isSelected,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(
          'assets/app_icon.png', // Your splash image
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
