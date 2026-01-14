import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

class GoogleMapIframe extends StatelessWidget {
  const GoogleMapIframe({super.key});

  static bool _isRegistered = false;

  @override
  Widget build(BuildContext context) {
    const viewType = 'google-map-iframe';

    if (!_isRegistered) {
      ui.platformViewRegistry.registerViewFactory(
        viewType,
        (int viewId) {
          final iframe = web.HTMLIFrameElement()
            ..src =
                'https://www.google.com/maps?q=Ravi+Bhawan+Kalimati+Kathmandu&output=embed'
            ..style.border = '0'
            ..style.width = '100%'
            ..style.height = '100%'
            ..style.display = 'block'
            ..allowFullscreen = true;

          return iframe;
        },
      );
      _isRegistered = true;
    }

    return const HtmlElementView(viewType: viewType);
  }
}
