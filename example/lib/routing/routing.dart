import 'package:go_router/go_router.dart';
import 'package:example/main.dart';

final class Routing {
  const Routing._();

  static List<GoRoute> routes() => [
    GoRoute(
      path: '/',
      name: 'Home',
      builder: (_, _) => const HomePage(),
      routes: [
        GoRoute(
          path: '/details',
          builder: (_, _) => const DetailsPage(),
          routes: [
            GoRoute(
              path: '/about',
              name: 'About',
              builder: (_, _) => const AboutPage(),
            ),
          ],
        ),
        GoRoute(
          path: '/contact',
          name: 'Contact',
          builder: (_, _) => const ContactPage(),
        ),
      ],
    ),
  ];
}
