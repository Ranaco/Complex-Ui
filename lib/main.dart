import 'package:complex_ui/app/app.locator.dart';
import 'package:complex_ui/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRouter _appRouter = AppRouter();
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: "Ubutnu",
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      routeInformationProvider: _appRouter.routeInfoProvider(),
    );
  }
}
