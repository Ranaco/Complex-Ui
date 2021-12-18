import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanTile extends StatelessWidget {
  PlanTile({Key? key, this.color, this.plan, this.day, this.image, this.toAdd})
      : super(key: key);
  Color? color;
  String? image;
  String? plan;
  String? day;
  bool? toAdd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
        ),
        height: 200,
        width: 270,
        child: Card(
          color: color,
          elevation: 30,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Stack(
            children: [
              Positioned(
                left: 180,
                child: image == null
                    ? const SizedBox()
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        height: 130,
                        width: 100,
                        child: Opacity(
                          opacity: 0.4,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/$image${image == "cigarette" ? ".jpg" : ".jpeg"}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, top: 25),
                child: Text(
                  plan!,
                  style: GoogleFonts.ubuntu(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color:
                          color == Colors.black ? Colors.white : Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90, left: 28),
                child: Text(
                  "Every\n day",
                  style: GoogleFonts.ubuntu(
                      fontSize: 15,
                      color:
                          color == Colors.black ? Colors.white : Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90, left: 130),
                child: Text(
                  day == null ? "" : day!,
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.w700,
                      color: day == "4 days left!"
                          ? Colors.white
                          : Colors.grey.shade500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
