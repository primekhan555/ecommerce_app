import 'package:ecommerceapp/navigation/params/details_screen_args.dart';
import 'package:ecommerceapp/presentation/views/cart_screen.dart';
import 'package:ecommerceapp/presentation/views/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/presentation/views/home_screen.dart';


class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    return switch (settings.name) {
      HomeScreen.routeName => route(const HomeScreen()),
      CartScreen.routeName => route(const CartScreen()),
      DetailsScreen.routeName => route(DetailsScreen(params: settings.arguments as DetailsScreenArgs)),
      //  route(HomeScreen(params: settings.arguments as HomeScreenArgs?)),
      // FirstScreen.routeName=> route(FirstScreen(
      //       firstScreenArgs: settings.arguments as FirstScreenArgs)),
      _ => route(const ErrorRoute()),
    };
  }
}

Route route(Widget screen) => MaterialPageRoute(builder: (context) => screen);

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('You should not be here...')));
}
