// ========================================
// lib/screens/home/home_screen.dart
// ========================================
import 'package:flutter/material.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/home/hero_section.dart';
import '../../widgets/home/about_vehicle_section.dart';
import '../../widgets/home/vehicle_specs_section.dart';
import '../../widgets/home/photo_gallery_section.dart';
import '../../widgets/home/vehicle_highlights_section.dart';
import '../../widgets/home/testimonials_section.dart';
import '../../widgets/home/map_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: const Column(
                children: [
                  HeroSection(),
                  AboutVehicleSection(),
                  VehicleSpecsSection(),
                  PhotoGallerySection(),
                  VehicleHighlightsSection(),
                  TestimonialsSection(),
                  MapSection(),
                  Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
