import 'package:flutter/material.dart';

String kUsername = "otaqu";
String kPassword = "qwerty";

var defaultShadow = BoxShadow(
  color: const Color(0xff000000).withOpacity(0.1),
  blurRadius: 10,
  offset: const Offset(0, 0),
);

List<String> promoImagePaths = [
  "assets/images/new-year.png",
  "assets/images/winter.png",
  "assets/images/explore.png",
  "assets/images/hammersonic.jpg",
  "assets/images/tour-yogya.png",
];

List<OnBoarding> onboardingImagePaths = [
  OnBoarding(
      imageUrl: "assets/images/onboarding-1.png",
      title: "Banyak Tempat Wisata",
      subtitle:
          "Kami menyediakan berbagai pilihan wisata untuk kamu yang suka jalan-jalan"),
  OnBoarding(
      imageUrl: "assets/images/onboarding-2.png",
      title: "Bepergian Mudah",
      subtitle: "Dengan OTAQU kamu akan sangat mudah memesan tempat tujuanmu"),
];

class OnBoarding {
  final String imageUrl;
  final String title;
  final String subtitle;

  OnBoarding({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}
