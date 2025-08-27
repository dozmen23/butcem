import 'package:flutter/material.dart';

final _colorSeed = const Color(0xFF4F46E5); // Indigo 600

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: _colorSeed, brightness: Brightness.light),
  useMaterial3: true,
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: _colorSeed, brightness: Brightness.dark),
  useMaterial3: true,
);
