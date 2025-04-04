import 'package:example/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:routing_generator/routing_generator.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static const String title =
      'Router Builder Example: Routing Generation by using annotations';

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(routes: Routing.routes()),
      title: title,
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeViewModel {
  final GoRouterState state;

  HomeViewModel(this.state);
}

@RoutingGenerator(path: '/', name: 'Home')
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => HomeViewModel(GoRouterState.of(context)),
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 32,
          children: [
            Text('Hello World!'),
            TextButton(
              onPressed: () => context.go('/details'),
              child: Text('Go to Details'),
            ),
            TextButton(
              onPressed: () => context.go('/details/about'),
              child: Text('Go to about'),
            ),
            TextButton(
              onPressed: () => context.go('/contact'),
              child: Text('Go to contacts'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsViewModel {
  final GoRouterState state;

  DetailsViewModel(this.state);
}

@RoutingGenerator(path: '/details')
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => DetailsViewModel(GoRouterState.of(context)),
      child: const DetailsScreen(),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailsViewModel viewModel = context.read();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 32,
          children: [
            Text('Details Screen: ${viewModel.state.path}'),
            TextButton(
              onPressed: () => context.pop(),
              child: Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutViewModel {
  final GoRouterState state;

  AboutViewModel(this.state);
}

@RoutingGenerator(path: '/details/about', name: 'About')
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      lazy: true,
      create: (_) => AboutViewModel(GoRouterState.of(context)),
      child: const AboutScreen(),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AboutViewModel viewModel = Provider.of(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 32,
          children: [
            Text('About Screen: ${viewModel.state.fullPath}'),
            TextButton(
              onPressed: () => context.pop(),
              child: Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactViewModel {
  final GoRouterState state;

  ContactViewModel(this.state);
}

@RoutingGenerator(path: '/contact', name: 'Contact')
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      lazy: true,
      create: (_) => ContactViewModel(GoRouterState.of(context)),
      child: const ContactScreen(),
    );
  }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AboutViewModel viewModel = Provider.of(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 32,
          children: [
            Text('Contact Screen: ${viewModel.state.fullPath}'),
            TextButton(
              onPressed: () => context.pop(),
              child: Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}
