import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/home/google_map_iframe.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),

            const SizedBox(height: 80),

            const _ContactSection(),

            const SizedBox(height: 80),

            // 🌍 FULL WIDTH MAP (WEB ONLY)
            if (kIsWeb)
              Container(
                width: double.infinity,
                height: 600,
                margin: const EdgeInsets.only(top: 20),
                child: const GoogleMapIframe(),
              ),

            const SizedBox(height: 80),

            const Footer(),
          ],
        ),
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width > 1200 ? 80 : 24,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT — FORM
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title('SEND US', 'MESSAGE'),
                const SizedBox(height: 40),
                const Row(
                  children: [
                    Expanded(child: _InputField(hint: 'Full Name')),
                    SizedBox(width: 20),
                    Expanded(child: _InputField(hint: 'Email Address')),
                  ],
                ),
                const SizedBox(height: 20),
                const _InputField(hint: 'Phone'),
                const SizedBox(height: 20),
                const _InputField(hint: 'Message', maxLines: 6),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 18,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Send'),
                ),
              ],
            ),
          ),

          const SizedBox(width: 80),

          // RIGHT — ADDRESS
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title('OUR', 'ADDRESS'),
                const SizedBox(height: 30),
                const Text(
                  'Shree Motors is Nepal’s trusted electric vehicle dealership, '
                  'committed to a cleaner, smarter, and sustainable future.',
                  style: TextStyle(height: 1.6),
                ),
                const SizedBox(height: 30),
                _infoRow(Icons.phone, 'Phone', '+977 9851408883'),
                const SizedBox(height: 20),
                _infoRow(Icons.email, 'Email', 'info@shreemotorsnp.com'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _title(String bold, String normal) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 32, color: Colors.black),
        children: [
          TextSpan(
            text: '$bold ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: normal),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 28, color: Colors.grey),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

class _InputField extends StatelessWidget {
  final String hint;
  final int maxLines;

  const _InputField({
    required this.hint,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.black),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}
