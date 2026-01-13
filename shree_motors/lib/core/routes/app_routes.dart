// lib/core/routes/app_routes.dart
import 'package:go_router/go_router.dart';
import '../screens/home/home_screen.dart';
import '../screens/vehicles/vehicles_screen.dart';
import '../screens/compare/compare_screen.dart';
import '../screens/support/support_screen.dart';
import '../screens/about/about_screen.dart';
import '../screens/contact/contact_screen.dart';
import '../screens/blogs/blogs_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String vehicles = '/vehicles';
  static const String compare = '/compare';
  static const String support = '/support';
  static const String about = '/about';
  static const String contact = '/contact';
  static const String blogs = '/blogs';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: vehicles,
        builder: (context, state) => const VehiclesScreen(),
      ),
      GoRoute(
        path: compare,
        builder: (context, state) => const CompareScreen(),
      ),
      GoRoute(
        path: support,
        builder: (context, state) => const SupportScreen(),
      ),
      GoRoute(
        path: about,
        builder: (context, state) => const AboutScreen(),
      ),
      GoRoute(
        path: contact,
        builder: (context, state) => const ContactScreen(),
      ),
      GoRoute(
        path: blogs,
        builder: (context, state) => const BlogsScreen(),
      ),
    ],
  );
}
