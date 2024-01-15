import 'package:ecommerceapp/di/di.dart';
import 'package:ecommerceapp/navigation/navigator_key.dart';
import 'package:ecommerceapp/navigation/route_generator.dart';
import 'package:ecommerceapp/resources/app_local.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/presentation/views/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants/app_colors.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  await DI.initDI();
  await AppLocal.instance.initStorage();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ecommerceapp',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: AppColors.kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomeScreen(),
      navigatorKey: navigatorKey,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}
