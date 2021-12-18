import 'package:complex_ui/UI/home_page/home_page_viewmodel.dart';
import 'package:complex_ui/UI/home_page/stack/awards_page/awards_page_view.dart';
import 'package:complex_ui/UI/home_page/stack/habit_page/habit_page_view.dart';
import 'package:complex_ui/UI/widgets/bottomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    super.initState();
  }

  toggleAward() {
    animationController!.forward();
  }

  toggleHabit() {
    animationController!.reverse();
  }

  bool truth = true;

  Color? habitColor = Colors.black;
  Color? awardsColor = Colors.grey.shade400;

  touchHabit() {
    if (!habitIndex) {
      setState(() {
        habitColor = Colors.black;
        awardsColor = Colors.grey.shade400;
        habitIndex = true;
        awardIndex = false;
      });
    } else if (habitIndex) {
      setState(() {
        habitColor = Colors.black;
        awardsColor = Colors.grey.shade400;
      });
    }
  }

  touchAward() {
    if (!awardIndex) {
      setState(() {
        awardsColor = Colors.black;
        habitColor = Colors.grey.shade400;
        awardIndex = true;
        habitIndex = false;
      });
    } else if (awardIndex) {
      setState(() {
        awardsColor = Colors.black;
        habitColor = Colors.grey.shade400;
        awardIndex = true;
        habitIndex = false;
      });
    }
  }

  var maxSlide = 410.0;
  var y = 0.0;

  bool habitIndex = true;
  bool awardIndex = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        builder: (context, model, child) {
          return PreferredSize(
            preferredSize: Size.copy(const Size.fromHeight(50)),
            child: Scaffold(
              body: Stack(children: [
                const AwardsPageView(),
                AnimatedBuilder(
                  animation: animationController!,
                  builder: (context, child) {
                    double slide = maxSlide * animationController!.value;
                    double ye = y * animationController!.value;
                    return Transform(
                        transform: Matrix4.identity()..translate(-slide, -ye),
                        child: const HabitPageView());
                  },
                ),
                Positioned(
                    child: Padding(
                  padding: const EdgeInsets.only(),
                  child: Container(
                      // color: Colors.pink,
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              toggleHabit();
                              touchHabit();
                            },
                            child: Text("Habits",
                                style: GoogleFonts.ubuntu(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: habitColor,
                                )),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              toggleAward();
                              touchAward();
                            },
                            child: Text(
                              "Awards",
                              style: GoogleFonts.ubuntu(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: awardsColor),
                            ),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("Hello");
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(-5, 5),
                                      blurRadius: 20,
                                      spreadRadius: 5,
                                      color: Colors.grey.shade400,
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://randomuser.me/api/portraits/women/83.jpg"))),
                            ),
                          ),
                        ],
                      )),
                ))
              ]),
              bottomNavigationBar: const CustomAppBar(),
            ),
          );
        });
  }
}
