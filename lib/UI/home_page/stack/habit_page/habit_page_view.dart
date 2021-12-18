import 'package:complex_ui/UI/home_page/stack/habit_page/habit_page_viewmodel.dart';
import 'package:complex_ui/UI/widgets/modern_tiles/plan_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class HabitPageView extends StatelessWidget {
  const HabitPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> color = const [
      Color(0xffE8E0D6),
      Color(0xffD18374),
      Color(0xffB7C0C8),
    ];

    List<String> alsoTry = const ["High-Protien", "Intermediate fast", "Gym"];
    List<String> alsoTryImage = const ["eggs", "fasting", "gym"];
    List<String> plan = const [("No Sugar"), ("Run"), ("No Smoking")];
    List<String> image = const ["run", "no-sugar", "cigarette"];

    List<String> days = const ["23 days left!", "4 days left!", "16 days left"];

    return ViewModelBuilder<HabitPageViewModel>.reactive(
      viewModelBuilder: () => HabitPageViewModel(),
      builder: (context, model, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 110.0),
          child: Scaffold(
            backgroundColor: const Color(0xffF1F1F3),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 50),
                  child: Row(
                    children: [
                      Text(
                        "YOUR PLAN",
                        style: GoogleFonts.ubuntu(
                            color: Colors.grey.shade700, fontSize: 15),
                      )
                    ],
                  ),
                ),
                ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView.builder(
                      padding: const EdgeInsets.only(
                          bottom: 400, top: 80, left: 20, right: 10),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print("Jeose");
                          },
                          child: PlanTile(
                            image: image[index],
                            day: days[index],
                            plan: plan[index],
                            color: color[index],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 370.0),
                  child: Container(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "ALSO TRY",
                          style: GoogleFonts.ubuntu(
                              color: Colors.grey.shade700, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 400,
                  ),
                  child: SizedBox(
                    height: 300,
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: ListView.builder(
                          padding: const EdgeInsets.only(left: 20, bottom: 70),
                          shrinkWrap: true,
                          itemCount: color.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 300,
                              height: 200,
                              child: PlanTile(
                                image: alsoTryImage[index],
                                color: index == 0 ? Colors.black : color[index],
                                plan: alsoTry[index],
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
