import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF242C3B); // Dark Blue-Gray
  static const Color primaryLight = Color(0xFF37B6E9); // Light Blue
  static const Color secondary = Color(0xFF4B4CED); // Vivid Blue
  static const Color dark = Color(0xFF353F54); // Darker Blue-Gray
  static const Color darker = Color(0xFF222834); // Almost Black

  // supporting colors
  static const Color greenLight = Color(0xFFA4E168); // Light green color
  static const Color greenStyle = Color(0xFF55A339); // A deeper green color
  static const Color blueStyle = Color(0xFF004A8E); // A dark blue color
  static const Color bgColor = Color(0xFFF5F5F5); // Light background color
  static const Color black = Color(0xFF000000); // Black color
  static const Color white = Color(0xFFFFFFFF); // White color
  static const Color red = Color(0xFFFF0000); // Red color
  static const Color light1 = Color(0xFFFFFDFD); // Very light color

  // Utility functions for dynamic color changes based on theme
  static Color bw(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.black
          : Colors.white;

  static Color bw10(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.black.withOpacity(.1)
          : Colors.white.withOpacity(.1);

  static Color bw20(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.black.withOpacity(.2)
          : Colors.white.withOpacity(.2);

  static Color bw30(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.black.withOpacity(.3)
          : Colors.white.withOpacity(.3);

  static Color bw40(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.black.withOpacity(.4)
          : Colors.white.withOpacity(.4);

  static Color bw50(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.black.withOpacity(.5)
          : Colors.white.withOpacity(.5);

  static Color bw60(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.black.withOpacity(.6)
          : Colors.white.withOpacity(.6);

  static Color bw70(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.black.withOpacity(.7)
          : Colors.white.withOpacity(.7);

  static Color bw80(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.black.withOpacity(.8)
          : Colors.white.withOpacity(.8);

  static Color bw90(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.black.withOpacity(.9)
          : Colors.white.withOpacity(.9);

  static Color bw05(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.black.withOpacity(.05)
          : Colors.white.withOpacity(.05);
}
