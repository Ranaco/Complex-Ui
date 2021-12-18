import 'package:complex_ui/UI/widgets/modern_tiles/plan_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'awards_page_viewmodel.dart';

class AwardsPageView extends StatelessWidget {
  const AwardsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> listOfImages = ["image1", "image2", "image3"];
    List<Color> colorsToMake = [
      Colors.blue.shade200,
      Colors.pink.shade300,
      Colors.orange.shade400
    ];
    return ViewModelBuilder<AwardsPageViewModel>.reactive(
        viewModelBuilder: () => AwardsPageViewModel(),
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Scaffold(
                backgroundColor: const Color(0xffF1F1F3),
                body: Stack(
                  children: [
                    Positioned(
                        top: 160,
                        left: 20,
                        child: Text(
                          "CURRENT AWARDS",
                          style: GoogleFonts.ubuntu(
                              color: Colors.grey.shade700, fontSize: 15),
                        )),
                    ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: ListView.builder(
                            itemCount: listOfImages.length,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(
                                bottom: 400, top: 190, left: 20, right: 10),
                            itemBuilder: (context, index) {
                              return PlanTile(
                                image: listOfImages[index],
                                plan: "Hello",
                                color: colorsToMake[index],
                              );
                            })),
                  ],
                )),
          );
        });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
