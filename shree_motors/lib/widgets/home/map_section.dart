import 'package:flutter/material.dart';
import 'google_map_iframe.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 450,
      width: double.infinity,
      child: GoogleMapIframe(),
    );
  }
}
