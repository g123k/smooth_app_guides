import 'package:flutter/material.dart';
import 'package:smooth_guide/guides/guide/guide_nutriscore_v2.dart';
import 'package:smooth_guide/theme_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        extensions: [
          SmoothColorsThemeExtension.defaultValue(),
        ],
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'OpenSans',
      ),
      home: const NutriScoreGuide(),
    );
  }
}

class NutriScoreGuide extends StatelessWidget {
  const NutriScoreGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GuideNutriscoreV2(),
    );
  }
}
