import 'package:auto_route/auto_route.dart';
import 'package:complex_ui/UI/home_page/home_page_view.dart';
import 'package:complex_ui/UI/home_page/stack/awards_page/awards_page_view.dart';
import 'package:complex_ui/UI/home_page/stack/habit_page/habit_page_view.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'app.router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: "View,Route", routes: <AutoRoute>[
  AutoRoute(
    page: HomePageView,
    initial: true,
  ),
  AutoRoute(page: AwardsPageView),
  AutoRoute(page: HabitPageView)
])
@singleton
class AppRouter extends _$AppRouter {}
