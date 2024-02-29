import 'package:easac_task/core/widgets/web_view.dart';
import 'package:flutter/material.dart';
import 'package:easac_task/features/auth/presentation/login_screen.dart';
import 'package:easac_task/features/home/home_screen.dart';

class Routes {
  static const String login = "/login";
  static const String home = "/home";
  static const String webView = "/webView";

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.webView:
        WebViewModel webViewModel = settings.arguments as WebViewModel;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => WebView(
              url:webViewModel.url ,
              title:webViewModel.title,
            ));

    }
    return unDefinedRoute();

  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold());
  }
}
class WebViewModel {
  final String url;

  final String title;


  WebViewModel(
      {required this.url, required this.title,});
}